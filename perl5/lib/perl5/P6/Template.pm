package P6::Template;
use parent 'P6';

## core
use strict;
use warnings FATAL => 'all';

## dist
use Scalar::Util ();

## cpan
use Template ();

## custom
use P6::Util ();

## overloads

## version

## constants

## globals

## methods
sub render {
    my $class = shift;
    my ($data, %args) = @_;

#    $args{header} ||= "header.$args{format}";
#    $args{footer} ||= "footer.$args{format}";

    my $ipaths = $args{paths} ? $args{paths} : [];

    my %t_options = (
		      INTERPOLATE  => 1,
		      INCLUDE_PATH => $ipaths,       # or list ref
		      POST_CHOMP   => 1,             # cleanup whitespace
		      EVAL_PERL    => 1,             # evaluate Perl code blocks
#		      PRE_PROCESS  => $args{header}, # prefix each template
#		      POST_PROCESS => $args{footer}, # prefix each template
		    );
#    $args{layoutoff} and delete $t_options{$_} foreach (qw(PRE_PROCESS POST_PROCESS));

    $data->{dumper} = sub {
	if ($P6::Util::Debug) {
	    use Data::Dumper ();
	    Data::Dumper::Dumper $_[0];
	}
    };

    $data->{lprint} = sub { P6::Util::lprint(@_) };
    $data->{rprint} = sub { P6::Util::rprint(@_) };

    my $error;
    my $template = Template->new(%t_options);
    P6::Util::debug("$args{ifile} -> $args{output}\n");
    $template->process($args{ifile}, $data, $args{output}) or $error = $template->error();
    P6::Util::error($error) if $error;

    return $error;
}

## private

1;
