package P6::AWS::SGen::Cmd;
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
use P6::Template ();

## Constants

## methods

## private
sub _fields {

  {
    service => "",
    cmd     => "",
    args    => [],

    required_args => [],
    optional_args => [],
    flag_args     => [],
    cmd_api_func  => "",
    log_type      => "",
    scount        => 0,
  }
}

sub _post_init {
  my $self = shift;
  my %args = @_;

  $self->parse();

  return;
}

sub args_parse {
  my $self = shift;

  my $service = $self->service();
  my $cmd = $self->cmd();

  my ($rv, $cmd_doc_str) = P6::Util::execute("aws $service $cmd help 2>/dev/null", { output => 1, silent => 1 });
  # P6::Util::debug("$cmd_doc_str");

  my @lines = split /\n/, $cmd_doc_str;
  # P6::Util::debug_dumper("lines", \@lines);

  my $pflag = 0;
  my @arg_lines = ();
  foreach my $line (@lines) {
    $line =~ s/[^a-zA-Z0-9\[\] \-]//g;

    $pflag = 1 if $line =~ /SSYYNNOOPPSSIISS/;
    $pflag = 0 if $line =~ /OOPPTTIIOONNSS/;

    push @arg_lines, $line if $pflag && $line !~ /SSYYNNOOPPSSIISS|$cmd/;
  }

  my @args = grep { P6::Util::trim ; 1 } @arg_lines;
  # P6::Util::debug_dumper("args", \@args);

  $self->args(\@args);
}

sub cmd_api_func_parse {
  my $self = shift;

  my $cmd_func = $self->cmd();
  $cmd_func =~ s/-/_/g;

  my $cmd_api_func = $cmd_func;
  $cmd_api_func = "${2}_${1}" if $cmd_api_func =~ /^([^_]+)_(.*)$/;

  $self->cmd_api_func($cmd_api_func);
}

sub required_args_parse {
  my $self = shift;

  my @required_args = ();
  foreach my $arg (grep { /^--/ } @{$self->args()}) {
    #	P6::Util::debug("arg: $arg\n");
    $arg =~ /^--([a-z0-9\-]+) /;
    my $arg_name = $1;
    my $arg_var =  $1;
    $arg_var =~ s/\-/_/g;

    push @required_args, { name => $arg_name, var => $arg_var };
  }

  $self->required_args(\@required_args);
}

sub optional_args_parse {
  my $self = shift;

  my @optional_args = ();

  foreach my $arg (grep { /^\[--/ && !/cli-input-json|generate-cli-skeleton/ && /value/ } @{$self->args()}) {
    # P6::Util::debug("arg: $arg\n");
    my $arg_name = $arg =~ /^\[--([a-z0-9\-]+) / ? $1 : $arg;
    my $arg_var =  $arg_name;
    $arg_var =~ s/\-/_/g;

    push @optional_args, { name => $arg_name, var => $arg_var };
  }

  $self->optional_args(\@optional_args);
}

sub flags_args_parse {
  my $self = shift;

  my @flag_args = ();

  foreach my $arg (grep { /^\[--/ && !/value/ } @{$self->args()}) {
    #	P6::Util::debug("flag <$arg>\n");
    my $default=(split / /, $arg)[0];
    $default =~ s/^\[--//;
    $default =~ s/\]$//;
    # P6::Util::debug("$default\n");

    my $arg_var =  $default;
    $arg_var =~ s/\-/_/g;

    my $func = $arg_var;
    $func = $2 if $arg_var =~ /([^_]+)_(.*)/;

    push @flag_args, { name => $default, var => $arg_var, func => $func };
  }

  $self->flag_args(\@flag_args);
}

sub log_type_parse {
  my $self = shift;

  my $log_type = $self->cmd_api_func() =~ /describe|list|get/ ? 'log_and_run' : 'cond_log_and_run';
  $self->log_type($log_type);
}

sub scount_parse {
  my $self = shift;

  $self->scount(scalar @{$self->required_args()});
}

sub parse {
  my $self = shift;

  P6::Util::debug($self->cmd() . "....\n");
  $self->args_parse();
  $self->required_args_parse();
  $self->optional_args_parse();
  $self->flags_args_parse();
  $self->scount_parse();
  $self->cmd_api_func_parse();
  $self->log_type_parse();

  return;
}

sub code {
  my $self = shift;
  my %args = @_;

  my $data = $self->_data();
  $data->{shell_service} = $self->shell_service();

  my $rv1 = P6::Template->render(
				 $data,
				 %args,
				 paths  => $self->tmpl_paths(),
				 ifile  => $self->tmpl(),
				 output => $self->shell_file(%args),
			       );

  my $rv2 = P6::Template->render(
				 $data,
				 %args,
				 paths  => $self->tmpl_paths(),
				 ifile  => $self->uwtmpl(),
				 output => $self->uw_shell_file(%args),
			       ) if $self->cmd() =~ /update/;

  $rv1 && $rv2;
}

sub shell_service() {
  my $self = shift;

  my $service = $self->service();
  $service =~ s/-/_/g;

  $service;
}

sub tmpl_paths { "$ENV{HOME}/dev/tt" }

sub tmpl { "aws_func.tt" }
sub uwtmpl { "aws_uw_func.tt" }

sub shell_file {
  my $self = shift;
  my %args = @_;

  "$args{outputdir}/sh/api/" . $self->shell_service() . "/" . $self->cmd_api_func() . ".sh";
}

sub uw_shell_file {
  my $self = shift;
  my %args = @_;

  "$args{outputdir}/sh/uw/" . $self->shell_service() . "/" . $self->cmd_api_func() . ".sh";
}

1;
