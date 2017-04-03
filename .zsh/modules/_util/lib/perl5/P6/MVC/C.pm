package P6::MVC::C;

## core
use strict;
use warnings FATAL => 'all'; no warnings qw(redefine);
use Carp;

## mp2
use Apache2::RequestRec ();

## libapreq2
use APR::Request ();
use APR::Request::Apache2 ();

## dist
use Data::Dumper;

## cpan

## custom
use P6 ();
use P6::Util ();

## version
our $VERSION = q$Revision: 34605 $;

## constants

## globals
our @ISA = qw(P6);

sub handler {
    my $r = shift;

    my $uri = $r->uri;
    P6::Util::debug("uri: [$uri]\n");
    $uri =~ s!^/!!;

    my ($site, @parts) = split /\//, $uri;
    P6::Util::debug("site: [$site]\n");

    my $pkg = P6::Const::SITE . "::" . ucfirst $site . "::Router";
    P6::Util::my_require($pkg);
    P6::Util::debug("router: [$pkg]\n");

    my ($controller, $func, %args) = P6::MVC::C::Router::route($pkg, $r, $uri);
    P6::Util::debug("controller: [$controller]\n");
    P6::Util::debug("func: [$func]\n");
    P6::Util::debug("args: " . Dumper(\%args) . "\n");

    my $req = APR::Request::Apache2->handle($r);
    my @params = $req->param;
    my %params = map { $_ => $req->param($_) } @params;
    P6::Util::debug("params: " . Dumper(\%params) . "\n");

    P6::Util::my_require($controller);
    my $rv = eval {
        no strict 'refs';
        my $method = "${controller}::${func}";
        &$method($r, %args, %params);
    };
    confess $@ if $@;

    return $rv;
}

1;
