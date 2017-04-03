package P6::AWS::SGen::Service;
use parent 'P6::Object';

## core
use strict;
use warnings FATAL => 'all';
use Carp;

## Std

## CPAN

## Globals

## SDK
use P6::Util ();

use P6::AWS::SGen::Cmd ();

## Constants

## methods

## private
sub _fields {

  {
    service => "",
    cmds    => [],

    cmd     => ""
  }
}

sub _post_init {
  my $self = shift;
  my %args = @_;

  $self->cmds($self->cmd_list(%args));

  return;
}

sub cmd_list {
  my $self = shift;
  my %args = @_;

  my @cmds = ();
  if ($self->service() =~ /^s3$/) {
    @cmds = (qw(cp ls mb mv presign rb rm sync website));
  }
  else {
    my $service = $self->service();
    my $cmd = "aws $service help 2>/dev/null | strings | perl -lane 'print \$1 if /^o ([a-z]+-[a-z0-9\-]+)/' | xargs";
    my ($rv, $cmd_str) = P6::Util::execute($cmd, { output => 1 });
    @cmds = grep { chomp ; 1 } split / /, $cmd_str;
  }
  # P6::Util::debug_dumper("cmds", \@cmds);

  [
   map { P6::AWS::SGen::Cmd->new(service => $self->service(), cmd => $_) }
    grep { $args{cmd} ? /$args{cmd}/ : 1 }
    @cmds
  ];
}

1;
