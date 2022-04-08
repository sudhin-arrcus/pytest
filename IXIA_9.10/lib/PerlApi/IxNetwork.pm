#!/usr/bin/perl 
use strict;
use lib ".";
use checkDependencies;
use IxNetworkLegacy;
use IO::Socket;
use validate;

package IxNetwork;

=head1 new
=cut
use constant NL => "\r\n";

my $gobalSecureTransport = undef;

sub new {
    my $class = shift;
    my $self = {
        _version => '9.10.2007.7',
        _OK => '::ixNet::OK',
        _ERROR => '::ixNet::ERROR',
        _transportType => undef,
        _noApiKey => '00000000000000000000000000000000',
        _debug => undef
   };
    $self->{__ixNetworkLegacy} = new IxNetworkLegacy();
    $self->{__ixNetworkSecure} = undef;
    $self->{__ixNetworkSecureImportError} = undef;
    my $ret = eval {
        checkDependencies::checkDeps();
        require IxNetworkSecure;
        IxNetworkSecure->import();
        $self->{__ixNetworkSecure} = new IxNetworkSecure();
        1; 
    };
    if (!$ret and $@) {
        $self->{__ixNetworkSecure} = undef;
        $self->{__ixNetworkSecureImportError} = $@."\n";
        print "WARNING: $@";
        print "If you are trying to connect to a Windows IxNetwork API Server on TCL port you can safely ignore this warning.\n";
    }

    bless $self, $class;
    return $self;
}

sub _getCurrentTransport {
    my $self = shift;
    
    if ($self->{__ixNetworkSecure} and $self->{__ixNetworkSecure}->_isConnected()) {
        return $self->{__ixNetworkSecure};
    } else {
        return $self->{__ixNetworkLegacy};
    }
}

sub _getSecureTransport {
    my $self = shift;

    if ($self->{__ixNetworkSecure}) {
        return $self->{__ixNetworkSecure};
    } else {
        die $self->{__ixNetworkSecureImportError};
    }
}

sub _isConnected {
    my $self = shift;

    if ($self->{__ixNetworkSecure}) {
        my $ret = $self->{__ixNetworkLegacy}->_isConnected() || $self->{__ixNetworkSecure}->_isConnected();
        return $ret;
    } 

    return $self->{__ixNetworkLegacy}->_isConnected();
}

sub _log {
    my $self = shift;
    my $msg = shift;

    if ($self->{_debug}) {
        my $now = localtime(time);
        if (length($msg) > 1024) {
            $msg = substr($msg, 0, 1024)."...\n";
        }
        print '['.$now.'] [IxNet] [debug] '.$msg;
    }
}

sub _detectTransport {
    my ($self, $hostname, $port) = @_;

    $self->_log("Detecting transport type...\n");
    my $_socket = undef;
    my $_transport = undef;
    my $usingDefaultPorts = undef;
    if (not defined $port) {
        $port = 8009;
        $usingDefaultPorts = 1;
    } else {
        $usingDefaultPorts = 0;
    }

    my $ret = eval {      
        my $inetAddress = undef;
        my $sockAddress = undef;
        if (validate::isIpv6($hostname) == 0) {
            # connect to IPv4 address (or a host name).
            my $protocol = getprotobyname('tcp');
            socket($_socket, Socket::AF_INET, Socket::SOCK_STREAM, $protocol);
            my $inetAddress = gethostbyname($hostname);
            my $sockAddress = Socket::sockaddr_in($port, $inetAddress);
            $_socket->blocking(0);
            CORE::connect($_socket, $sockAddress);
        } else {
            # connect to a IPv6 address.
            if (!$checkDependencies::ipv6LoadError) {
                require LWP::Protocol::INET6;
                $_socket = LWP::Protocol::INET6->new(
                        PeerAddr => $hostname,
                        PeerPort => $port,
                        Proto    => 'tcp',
                )
                or die("Unknown Ipv6 address $hostname\n");
            } else {
                die("Unable to load perl IPv6 module\n");
            }
        }

        my $sock = $_socket;
        my $rin = '';
        my $win = '';
        my $buffer = '';
        my $timeout = 15;
        my $iterations = 2;
        vec($rin, fileno($sock), 1) = 1;
        vec($win, fileno($sock), 1) = 1;
        my $ein= $rin | $win;
        my $socketOpen = select(my $rout = $rin, my $wout = $win, my $eout = $ein, 1);
        while ($iterations > 0 and !$socketOpen) {
            $socketOpen = select(my $rout = $rin, my $wout = $win, my $eout = $ein, 1);
            $iterations -= 1;
        }
        if (!$socketOpen) {
            die "Host is unreachable.\n";
        }
        $_socket->blocking(1);
            
        vec($rin, fileno($sock), 1) = 1;
        my $readOpen = select(my $rout = $rin, undef, undef, $timeout);
        if (!$readOpen) {
            vec($win, fileno($sock), 1) = 1;
            my $writeOpen = select(undef, my $wout = $win, undef, $timeout);
            if ($writeOpen) {
                $_transport = $self->{__ixNetworkSecure};
            }
        }
        my $char = undef;
        $_socket->blocking(0);
        while(not defined $_transport) {
            $_socket->read($char, 1);    

            if (length($char) == 0) {
                last;
            }
            $buffer .= $char;
            if (length $buffer == 4) {
                if (index($buffer, '<001') == 0) {
                    $_transport = $self->{__ixNetworkLegacy};
                    last;
                } elsif (index($buffer, 'HTTP') != 0) {
                    $_transport = $self->{__ixNetworkSecure};
                    last;
                }
            }
            if ((length $buffer > 50) && 
                (index($buffer, 'Server: IxNetwork API Server') != -1) ||
                (index($buffer, 'Server: Connection Manager') != -1)) {
                    $_transport = $self->{__ixNetworkLegacy};
                    last;
            }
        }
        1;
    };
    if (!$ret and $@) {
        if ($_socket) {
            $_socket->close();
            $_socket = undef;
        }
        if (!$usingDefaultPorts) {
            die "Unable to connect to ".$hostname.':'.$port.'. Error: '.$@."\n";
        }
    }
    if ($_socket) {
        $_socket->close();
    }
    if ($usingDefaultPorts and (not defined $_transport)) {
        $_transport = $self->{__ixNetworkSecure};
    }
    if (not defined $_transport) {
        if (!$usingDefaultPorts) {
            die "Unable to connect to ".$hostname.':'.$port.". Error: Host is unreachable.\n";    
        } else {
            die "Unable to connect to ".$hostname." using default ports (8009, 443). Error: Host is unreachable.\n";    
        }
    }
    $self->_log('Using transport type '.$_transport->{_transportType}."\n");
    return $_transport;
}

sub setDebug {
    my $self = shift;
    my $debug = @_[0];

    $self->{_debug} = $debug;
    
    $self->{__ixNetworkLegacy}->setDebug(@_);
    if ($self->{__ixNetworkSecure}) {
        $self->{__ixNetworkSecure}->setDebug(@_);
    }
}

sub getRoot {
    return '::ixNet::OBJ-/';
}

sub getNull {
    return '::ixNet::OBJ-null';
}

sub setAsync {
    my $self = shift;
    
    return $self->_getCurrentTransport()->setAsync(@_);
}

sub setTimeout {
    my $self = shift;

    return $self->_getCurrentTransport()->setTimeout(@_);
}

sub getApiKey {
    my $self = shift;
    my $hostname = @_[0];
    if ($hostname == "") {
        my $msg .= "SyntaxError: This method requires at least the hostname argument. An example of a correct method call is:\n\t";
        $msg .= '$ixNet->getApiKey(<hostname>, "-username", <username>, "-password", <password> [,"-port", <443>] [, "-apiKeyFile", <api.key>])';
        die $msg."\n";   
    }
    if (!$self->{__ixNetworkSecure}) {
        print "Unable to get API key from ".$hostname." due to missing dependencies (see documentation for required dependencies). If you are trying to connect to a Windows IxNetwork API Server on TCL port you can safely ignore this warning.\n";
        return $self->{_noApiKey};
    }
    return $self->_getSecureTransport()->getApiKey(@_);
}

sub getSessions {
    my $self = shift;

    return $self->_getSecureTransport()->getSessions(@_);
}

sub getSessionInfo {
    my $self = shift;
    
    return $self->_getCurrentTransport()->getSessionInfo(@_);   
}

sub clearSessions {
    my $self = shift;
    
    return $self->_getSecureTransport()->clearSessions(@_);      
}

sub clearSession {
    my $self = shift;
    
    return $self->_getSecureTransport()->clearSession(@_);         
}

sub connect {
    my $self = shift;
    my $hostname = @_[0];
    my @args = @_[1..scalar(@_) - 1];

    my $ret = undef;
    if ($self->_isConnected() || (not defined $self->{__ixNetworkSecure})) {
        $ret = $self->_getCurrentTransport()->connect(@_);
    } else {
        my $nameValuePairs = {};
        my $name = undef;
        my $port = undef;
        foreach my $arg (@args) {
            if (index($arg, '-', 0) == 0) {
                if (not defined $name) {
                    $name = $arg;
                } else {
                    $nameValuePairs->{$name} = '';
                }
            } elsif (defined $name) {
                $nameValuePairs->{$name} = $arg;
                $name = undef;
            }
        }
        if (exists $nameValuePairs->{'-port'}) {
            $port = $nameValuePairs->{'-port'};
        }
        $ret = $self->_detectTransport($hostname, $port)->connect(@_);
    }
    $self->{_transportType} = $self->_getCurrentTransport()->{_transportType};
    if ($self->{_transportType} eq 'WebSocket') {
        $gobalSecureTransport = $self->_getCurrentTransport();
    }

    return $ret;
}

sub disconnect {
    my $self = shift;
    
    my $ret = $self->_getCurrentTransport()->disconnect();
    if ($gobalSecureTransport) {
        $gobalSecureTransport = undef;
    }
    $self->{_transportType} = undef; 

    return $ret;
}

sub help {
    my $self = shift;

    $self->_getCurrentTransport()->help(@_);
}

sub setSessionParameter {
    my $self = shift;

    $self->_getCurrentTransport()->setSessionParameter(@_);   
}

sub getVersion {
    my($self) = shift;

    if ($self->_isConnected()) {
        return $self->_getCurrentTransport()->getVersion();
    } else {
        return $self->{_version};
    }
}

sub getParent {
    my $self = shift;

    $self->_getCurrentTransport()->getParent(@_);   
}

sub exists {
    my $self = shift;

    $self->_getCurrentTransport()->exists(@_);      
}

sub commit {
    my $self = shift;

    $self->_getCurrentTransport()->commit(@_);
}

sub rollback {
    my $self = shift;

    $self->_getCurrentTransport()->rollback(@_);
}

sub execute {
    my $self = shift;

    $self->_getCurrentTransport()->execute(@_);
}

sub add {
    my $self = shift;

    $self->_getCurrentTransport()->add(@_);
}

sub remove {
    my $self = shift;

    $self->_getCurrentTransport()->remove(@_);
}

sub setAttribute {
    my $self = shift;

    $self->_getCurrentTransport()->setAttribute(@_);
}

sub setMultiAttribute {
    my $self = shift;

    $self->_getCurrentTransport()->setMultiAttribute(@_);
}

sub getAttribute {
    my $self = shift;

    $self->_getCurrentTransport()->getAttribute(@_);
}

sub getList {
    my $self = shift;

    $self->_getCurrentTransport()->getList(@_);
}

sub getFilteredList {
    my $self = shift;

    $self->_getCurrentTransport()->getFilteredList(@_);
}

sub adjustIndexes {
    my $self = shift;

    $self->_getCurrentTransport()->adjustIndexes(@_);
}

sub remapIds {
    my $self = shift;

    $self->_getCurrentTransport()->remapIds(@_);
}

sub getResult {
    my $self = shift;

    $self->_getCurrentTransport()->getResult(@_);
}

sub wait {
    my $self = shift;

    $self->_getCurrentTransport()->wait(@_);
}

sub isDone {
    my $self = shift;

    $self->_getCurrentTransport()->isDone(@_);
}

sub isSuccess {
    my $self = shift;

    $self->_getCurrentTransport()->isSuccess(@_);
}

sub xpath {
    my $self = shift;

    $self->_getCurrentTransport()->xpath(@_);
}

sub writeTo {
    my $self = shift;

    $self->_getCurrentTransport()->writeTo(@_);
}

sub readFrom {
    my $self = shift;

    $self->_getCurrentTransport()->readFrom(@_);
}

END {
    if ($gobalSecureTransport) {
        $gobalSecureTransport->disconnect();
        $gobalSecureTransport = undef;
    }
}

1;
