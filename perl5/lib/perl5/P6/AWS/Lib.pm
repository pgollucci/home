package P6::AWS::Lib;
use parent 'P6';

## core
use strict;
use warnings FATAL => 'all';

## dist

## cpan

## custom
use P6::Util ();
use P6::Template ();

## overloads

## version

## constants

## globals

## methods

sub services {
  my $self = shift;

  my ($rv, $services_str) = P6::Util::execute("aws help | awk '/o /{ print \$2 }' | tail -98 | xargs 2>/dev/null", { output => 1 } );
  my @services = grep { chomp ; 1 } split / /, $services_str;

  @services = grep { !/help|aws/ } @services;
  # P6::Util::debug_dumper("services", \@services);

  \@services;
}

sub cmds {
  my $self = shift;
  my ($service) = @_;

  my @cmds = ();
  if ($service =~ /^s3$/) {
    @cmds = (qw(cp ls mb mv presign rb rm sync website));
  }
  else {
    my ($rv, $cmd_str) = P6::Util::execute("aws $service help | strings | perl -lane 'print \$1 if /^o ([a-z]+-[a-z0-9\-]+)/' | xargs 2>/dev/null", { output => 1 });
    @cmds = grep { chomp ; 1 } split / /, $cmd_str;
  }

  # P6::Util::debug_dumper("cmds", \@cmds);

  \@cmds;
}

sub args {
  my $self = shift;
  my ($service, $cmd) = @_;

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

  \@args;
}

sub cmd_api_func {
  my $self = shift;
  my ($cmd) = @_;

  my $cmd_func = $cmd;
  $cmd_func =~ s/-/_/g;

  my $cmd_api_func = $cmd_func;
  $cmd_api_func = "${2}_${1}" if $cmd_api_func =~ /^([^_]+)_(.*)$/;

  $cmd_api_func;
}

sub required_args {
  my $self = shift;
  my ($args) = @_;

  my %required_args = ();
  my $i = 1;
  foreach my $arg (grep { /^--/ } @$args) {
    #	P6::Util::debug("arg: $arg\n");
    $arg =~ /^--([a-z0-9\-]+) /;
    my $arg_name = $1;
    my $arg_var =  $1;
    $arg_var =~ s/\-/_/g;

    $required_args{$arg_name} = $arg_var;
    $i++;
  }

  [map { { name => $_, var =>  $required_args{$_} } } keys %required_args];
}

sub log_type {
  my $self = shift;
  my ($cmd_api_func) = @_;

  $cmd_api_func =~ /describe|list|get/ ? 'log_and_run' : 'cond_log_and_run';
}

sub generate {
  my $self = shift;

  my $services = $self->services();

  foreach my $service (@$services) {
    my $service_dir = "/tmp/aws/lib/svc/${service}";
    P6::Util::mkdirp($service_dir);

    my $cmds = $self->cmds($service);
    foreach my $cmd (@$cmds) {
      # P6::Util::debug("$cmd");

      my $args = $self->args($service, $cmd);
      my $required_args = $self->required_args($args);
      my $shift = @$required_args;
      my $cmd_api_func = $self->cmd_api_func($cmd);
      my $log_type = $self->log_type($cmd_api_func);

      my $data = {
		  log_type      => $log_type,
		  service       => $service,
		  'shift'       => $shift,
		  cmd_api_func  => $cmd_api_func,
		  required_args => $required_args,
		 };

      my $rv = P6::Template->render(
				    $data,
				    paths => "$ENV{HOME}/dev/tt/",
				    ifile => 'aws_func.tt',
				    output => "$service_dir/${cmd_api_func}.sh",
				   );

    }
  }

  return P6::Const::EXIT_SUCCESS;
}

1;

=pod
      my %optional_args = ();
      my %special_args = ();

      # Flags
      foreach my $arg (grep { /^\[--/ && !/value/ } @args) {
	#	P6::Util::debug("special <$arg>\n");
	my $default=(split / /, $arg)[0];
	$default =~ s/^\[--//;
	$default =~ s/\]$//;

	my $arg_var =  $default;
	$arg_var =~ s/\-/_/g;

	# P6::Util::debug("$default\n");

	$special_args{$default} = $arg_var;
#	$contents .= "    local $arg_var=\"\$\{$i:--$default\}\"\n";;
	$i++;
      }

      ## Optional
      foreach my $arg (grep { /^\[--/ && !/cli-input-json|generate-cli-skeleton/ && /value/ } @args) {
	# P6::Util::debug("arg: $arg\n");
	my $arg_name = $arg =~ /^\[--([a-z\-]+) / ? $1 : $arg;
	my $arg_var =  $arg_name;
	$arg_var =~ s/\-/_/g;

	$optional_args{$arg_name} = $arg_var;
#	$contents .= "    local $arg_var=\"\$$i\" # optional \n";;
	$i++;
      }

#      $contents .=  "    local opt_str=\"\"\n" if %optional_args;

#      $contents .=  join("", map { "    if [ -n \"\$$optional_args{$_}\" ]; then opt_str=\"\$opt_str --$_ \$$optional_args{$_}; fi\n" } keys %optional_args);

#      $contents .=  "\n" if %optional_args;


#	(%special_args ? " " . join(" ", map { "\$$special_args{$_}" } keys %special_args) : "") .
#	( %optional_args ? " \$opt_str" : "" ) .

=cut
