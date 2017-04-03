package P6::Cache;

## core
use strict;
use warnings FATAL => 'all';
use Carp;

## mp2

## libapreq2

## dist

## cpan

## custom
use P6 ();

## version
our $VERSION = q$Revision: 48228 $;

## constants

## globals
our @ISA = qw(P6);
my $cache = ();

sub insert {
    my $class = shift;
    my %args = @_;

    return unless $args{obj}->cacheable();

    my $keys = $args{keys};

    foreach my $key (keys %$keys) {
        $cache->{$args{namespace}}->{$key}->{$keys->{$key}} = $args{obj};
    }

    return;
}

sub get {
    my $class = shift;
    my %args = @_;

    my $keys = $args{keys};

    foreach my $key (keys %$keys) {
         return $cache->{$args{namespace}}->{$key}->{$keys->{$key}}
             if exists $cache->{$args{namespace}}->{$key}->{$keys->{$key}};
    }

    return;
}

1;
