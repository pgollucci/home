package P6::AWS::ELB;
use parent 'P6::Object';

## core
use strict;
use warnings FATAL => 'all';
use Carp;

## Std
use Data::Dumper;

## CPAN
use JSON ();

## Globals

## SDK
use P6::Util ();

## Constants

## methods

## private
sub _fields {

  {
    elb_name => "",
    json => ""
  }
}

sub _post_init {
  my $self = shift;
  my %args = @_;

  my $elb_name = $self->elb_name();

  my ($rv, $json_str) = P6::Util::execute("aws elb describe-load-balancers --load-balancer-name $elb_name", { output => 1, silent => 1 });

  my $json = JSON->new()->allow_nonref()->pretty();
  my $scalar  = eval { $json->decode($json_str) };
  return $@ if $@;
  $self->json($scalar->{LoadBalancerDescriptions}->[0]);

  return;
}

sub display {
  my $self = shift;
  my %args = @_;

  my $scalar = $self->json();

  print "$scalar->{LoadBalancerName}\n";

  my $listener_descriptions = $scalar->{ListenerDescriptions};

  print "Listeners:\n";
  foreach my $listener_description (@$listener_descriptions) {
    my $listener = $listener_description->{Listener};

    print "\t";
    print P6::Util::rprint(5, "I/E");
    print "\t" . $listener->{LoadBalancerPort};
    print " (" . $listener->{Protocol};
    print ") -> (" . $listener->{InstancePort};
    print ") " . $listener->{InstanceProtocol};

    my $policies = $listener_description->{PolicyNames};
    print "    [";
    foreach my $policy_name (@$policies) {
      print $policy_name . ",";
    }
    print "]\n";
  }



  return;
}

1;
