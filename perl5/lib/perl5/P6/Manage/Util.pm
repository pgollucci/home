package P6::Manage::Util;

## core
use strict;
use warnings FATAL => 'all'; no warnings qw(redefine);
use Carp;

## mp2

## libapreq2

## dist
use Data::Dumper;
use IO::Select ();
use IO::Socket::INET ();

## cpan
use LWP::UserAgent ();

## custom
use P6::Manage::Systems ();
use P6::Util ();

use P6::Const ();
use P6::Site::Const ();

## version
our $VERSION = q$Revision: 45770 $;

## constants

## globals

sub can_connect {
    my ($timeout, @hosts) = @_;

    my @handles;

    # note: DNS lookups are done serially before the timeout
    foreach my $host (@hosts) {
        my $sock = IO::Socket::INET->new(
                                         PeerAddr => $host,
                                         PeerPort => P6::Const::PORT_SSH,
                                         Proto    => 'tcp',
                                         Blocking => 0,
                                        );
        push @handles, [ $host, $sock ] if defined $sock;
    }
    return unless @handles;

    my %ready;
    my $select = IO::Select->new(map { $_->[1] } @handles);
    my %fileno_to_host = map { $_->[1]->fileno() => $_->[0] } @handles;
    my $t0 = Time::HiRes::time();
    my $wait = $timeout || P6::Const::SSH_TIMEOUT;
    while ($select->count() > 0 && $wait > 0) {
        $wait = $wait - (Time::HiRes::time() - $t0);
        my ($read, $write, $except) =
        IO::Select::select($select, $select, $select, $wait > 0 ? $wait : 0);
        foreach my $h (@$read, @$write) {
            $select->remove($h);
            $ready{$fileno_to_host{$h->fileno()}} = 1 if $h->connected();
        }
    }

    return keys %ready;
}

sub lwp {
    my ($url, %args) = @_;

    local $ENV{PERL_LWP_SSL_VERIFY_HOSTNAME} = 0;

    my $ua = LWP::UserAgent->new();
    my $response;
    eval {
        local $SIG{ALRM};
        alarm(10);
        $ua->timeout(10);
        P6::Util::verbose(1, "lwp: $url\n");
        P6::Util::debug(Dumper \%args);
        if (%args) {
            $response = $ua->post($url, \%args);
        }
        else {
            $response = $ua->get($url);
        }
    };
    P6::Util::debug(Dumper $response);
    P6::Util::error($@) if $@;

    return $response;
}

1;
