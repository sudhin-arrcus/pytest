#!/usr/bin/perl
use File::Spec;
my $dependenciespath = undef;
my $ipv6Path         = undef;
my $ipv6ModuleExists = undef;
BEGIN {
    #----------------------------------------------------------------------------
    # Since we are trying to load  Socket6.dll Socket6.so there may be a
    # segmentation handle that gracefully
    #----------------------------------------------------------------------------
    our $ipv6LoadError = undef;
    $SIG{SEGV} = \&handler;
    sub handler {
        $SIG{SEGV} = 0;
        $checkDependencies::ipv6LoadError = 1;
        die "unable to load IPv6 Module";
    }

    my ($volume, $directory, $file) = File::Spec->splitpath(__FILE__);
    $dependenciespath = File::Spec->catdir((File::Spec->rel2abs($directory), 'dependencies'));
    $ipv6Path         = File::Spec->catdir((File::Spec->rel2abs($dependenciespath), 'IPv6Sock'));
    $ipv6ModuleExists = eval {require Socket6; 1;};
}
use lib $dependenciespath;
if ($ipv6ModuleExists != 1) {
    print "WARNING Default IPv6 Module Does not exist ";
    print "Loading IXIA specific IPv6 Module\n";
    use lib $ipv6Path;
};

package checkDependencies;

sub checkDeps {
    my @missingDependencies = ();
    my $ret = eval {
        require IO::Socket::SSL;
        IO::Socket::SSL->import();
        1; 
    };
    if (!$ret and $@) {
        push(@missingDependencies, "IO::Socket::SSL");
    }
    my $ret = eval {
        require LWP::UserAgent;
        LWP::UserAgent->import();
        1; 
    };
    if (!$ret and $@) {
        push(@missingDependencies, "LWP::UserAgent");
    }
    my $ret = eval {
        require Protocol::WebSocket::Client;
        Protocol::WebSocket::Client->import();
        1; 
    };
    if (!$ret and $@) {
        push(@missingDependencies, "Protocol::WebSocket::Client");
    }
    my $ret = eval {
        require JSON::PP;
        JSON::PP->import();
        1; 
    };
    if (!$ret and $@) {
        push(@missingDependencies, "JSON::PP");
    }
    my $ret = eval {
        require URI::Escape;
        URI::Escape->import();
        1; 
    };
    if (!$ret and $@) {
        push(@missingDependencies, "URI::Escape");
    }
    my $ret = eval {
        require Net::SSLeay;
        Net::SSLeay->import();
        1; 
    };
    if (!$ret and $@) {
        push(@missingDependencies, "Net::SSLeay");
    }
    my $ret = eval {
        require LWP::Protocol::https;
        LWP::Protocol::https->import();
        1; 
    };
    if (!$ret and $@) {
        push(@missingDependencies, "LWP::Protocol::https");
    }
    my $ret = eval {
        require Time::Seconds;
        Time::Seconds->import();
        1; 
    };
    if (!$ret and $@) {
        push(@missingDependencies, "Time::Seconds");
    }
    my $ret = eval {
        require Socket6;
        Socket6->import();
        1; 
    };
    if (!$ret and $@) {
        push(@missingDependencies, "Socket6");
    }

    if (scalar(@missingDependencies) > 0) {
        my $enumeratedDependencies = join(', ', @missingDependencies);
        die 'Cannot load required dependencies: '.$enumeratedDependencies.". \nPlease consult documentation for installing required dependencies.\n";
    }
};

1;


