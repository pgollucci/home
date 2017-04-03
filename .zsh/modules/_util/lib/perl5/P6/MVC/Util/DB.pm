package P6::MVC::Util::DB;

## core
use strict;
use warnings FATAL => 'all';
use Carp;

## mp2

## libapreq2

## dist

## cpan

## custom
use P6::DB ();

## version
our $VERSION = q$Revision: 33497 $;

## constants

## globals

sub dbh {
    my $class = shift;
    my %args = @_;

    my $model = $args{model};
    my $db = $model->db();
    my $dbh = P6::DB->dbh(%$db);

    return $dbh;
}

1;
