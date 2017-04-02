package P6::MVC::V;

## core
use strict;
use warnings FATAL => 'all'; no warnings qw(redefine);
use Carp;

## mp2
use Apache2::RequestRec ();
use Apache2::Log ();

## libapreq2

## dist
use Data::Dumper;

## cpan
use Template ();
use JSON ();

## custom
use P6 ();
use P6::Conf ();
use P6::Util ();

## version
our $VERSION = q$Revision: 34707 $;

## constants

## globals
our @ISA = qw(P6);

sub formats {
    {
        gchart => 'render_template',
        tt     => 'render_template',
        json   => 'render_json',
    }
}

sub render {
    my $class = shift;
    my $r = shift;
    my ($data, %args) = @_;

    $data->{debug} = $P6::Util::Debug;
    $data->{args} = \%args;

    $args{format} ||= 'tt';

    my $format = formats()->{$args{format}};

    {
        no strict 'refs';
        return $class->$format($r, $data, %args);
    }
}

sub render_json {
    my $class = shift;
    my $r = shift;
    my ($data, %args) = @_;

    my $json = JSON->new();
    $json->pretty();
    $json->allow_unknown();

    my $json_str = eval { JSON::encode_json($data) };
    return $@ if $@;

    $r->print($json_str);

    return P6::Const::EXIT_SUCCESS;
}

sub render_template {
    my $class = shift;
    my $r = shift;
    my ($data, %args) = @_;

    $args{header} ||= "header.$args{format}";
    $args{footer} ||= "footer.$args{format}";

    $args{content_type} ||= 'text/html';
    $args{charset}      ||= 'utf8';

    my ($site, $controller) = class_2_tmpl_path($class);
    my $view = view();

    my $ifile = ifile($site, $controller, $view, %args);

    my $ipaths = [
                  "$P6::Conf::TT/default",
                  "$P6::Conf::TT/default/$site",
                  "$P6::Conf::TT/default/$site/$controller"
                 ];

    my %t_options = (
                      INCLUDE_PATH => $ipaths,       # or list ref
                      POST_CHOMP   => 1,             # cleanup whitespace
                      EVAL_PERL    => 1,             # evaluate Perl code blocks
                      PRE_PROCESS  => $args{header}, # prefix each template
                      POST_PROCESS => $args{footer}, # prefix each template
                    );
    $args{layoutoff} and delete $t_options{$_} foreach qw(PRE_PROCESS POST_PROCESS);

    $r->content_type("$args{content_type}; charset=$args{charset}");

    my $error;
    my $template = Template->new(%t_options);
    $template->process($ifile, $data, $r) or $error = $template->error();
    if ($error) {
        $r->log_error($error) if $error;
    }
    else {
        if ($P6::Util::Debug) {
            $r->print("<br /><br /><br /><br /><hr />");
            $r->print("<pre>" . Dumper($data) . "</pre>");
        }
    }

    return $error;
}

sub ifile {
    my ($site, $controller, $view, %args) = @_;

    if ($args{ifile}) {
        $args{ifile} = "$site/$controller/$args{ifile}.$args{format}";
    }
    else {
        $args{ifile} = "$site/$controller/$view.$args{format}";
    }
    P6::Util::debug("ifile: [$args{ifile}]\n");

    return $args{ifile};
}

sub class_2_tmpl_path {
    my ($class) = @_;

    ## XXX: un hardcode ?
    $class =~ s/P6::Site:://;

    return map { lc } split /::/, $class;
}

sub view {

    my $view = (caller(3))[3];

    $view =~ s/.*:://;
    $view =~ s/default/index/;

    return $view;
}

1;
