package P6::MVC::C::Router;

## core
use strict;
use warnings FATAL => 'all'; no warnings qw(redefine);
use Carp;

## mp2

## libapreq2

## dist

## cpan

## custom
use P6 ();

## version
our $VERSION = q$Revision: 34292 $;

## constants

## globals
our @ISA = qw(P6);

sub route {
    my $class = shift;
    my ($r, $uri) = @_;

    my $pkey = (split /\//, $uri, 3)[2];

    my $base = $class;
    $base =~ s/::Router//;

    ## Controller
    my $pkg = (split /\//, $uri, 3)[1];
    $pkg = ucfirst $pkg;

    my ($func, %args) = $class->route($pkg, $pkey);

    return ("${base}::${pkg}", $func || 'default', %args);
}
