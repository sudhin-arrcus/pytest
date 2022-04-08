package validate;
my $LEVEL = 1;

#------------------------------------------------------------------------------
# Verify if a address is IPv6
#------------------------------------------------------------------------------
sub isIpv6 {
    my $address      = @_[0];
    my @addressBytes = split(':', $address);
    my $isIpv6Addr   = 0;
    my $len          = @addressBytes;
    if ($len <= 8) {
        foreach $bytes (@addressBytes) {
            if (length($bytes) <= 4) {
               if ($bytes ne '') {
                   if (($bytes =~ /[a-f,A-F]|[0-9]/) &&
                      !($bytes =~ /[g-z,G-Z]/)) {
                       $isIpv6Addr = 1;
                   } else {
                       $isIpv6Addr = 0;
                       return $isIpv6Addr;
                   }
               }
            } else {
                $isIpv6 = 0;
                return $isIpv6Addr
            }
        }
    }
    return $isIpv6Addr;
}

#------------------------------------------------------------------------------
# Verify if a address is IPv4
#------------------------------------------------------------------------------
sub isIpv4 {
    $DB::single=1;
    my $address      = @_[0];
    my @addressBytes = split('\.', $address);
    my $isIpv4Addr   = 0;

    my $len = @addressBytes;
    if ($len == 4) {
        foreach $bytes (@addressBytes) {
            if ((int($bytes) >= 0) && (int($bytes) <= 255)) {
                $isIpv4Addr = 1;
            } else {
                $isIpv4Addr = 0;
                return $isIpv4Addr
            }
        }
    }
    return $isIpv4Addr;
}

1;