package P6::AWS::SGen;
use parent 'P6';

## core
use strict;
use warnings FATAL => 'all';
use Carp;

## Std

## CPAN

## Globals

## SDK
use P6::AWS::SGen::Service ();
use P6::AWS::SGen::Cmd ();

## Constants

## methods
sub services {
    my %args = @_;

    my ($rv, $services_str) = P6::Util::execute("aws help | awk '/o /{ print \$2 }' | tail -98 | xargs 2>/dev/null", { output => 1 } );
    my @services = grep { chomp ; 1 } split / /, $services_str;

    @services = grep { !/help|aws/ } @services;
    @services = grep { /^$args{service}$/ } @services if $args{service};
    # P6::Util::debug_dumper("services", \@services);

    [map { P6::AWS::SGen::Service->new(service => $_, cmd => $args{cmd}) } @services];
}

sub generate {
  my %args = @_;

  my $services = services(%args);
  foreach my $service (@$services) {
    my $cmds = $service->cmds();
    foreach my $cmd (@$cmds) {
      $cmd->code(%args);
    }
  }
}

1;
