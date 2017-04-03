package P6::DB;

## core
use strict;
use warnings FATAL => 'all';
use Carp;

## mp2

## libapreq2

## dist

## cpan
use DBI ();
use Time::HiRes ();

## custom
use P6 ();
use P6::IO ();
use P6::Util ();

## version
our $VERSION = q$Revision: 42734 $;

## constants

## globals
our @ISA = qw(P6 DBI);

my %cache = ();

our %db_attrs = (
                 RaiseError         => 1,
                 PrintError         => 0,
                 Taint              => 0,
                 AutoCommit         => 1,
                 LongReadLen        => 50000,
                 LongTruncOk        => 1,
                 ShowErrorStatement => 1,
                 ChopBlanks         => 1,
                 FetchHashKeyName   => "NAME_lc",
                );

__PACKAGE__->init_rootclass();

# sub disconnect { }

sub dbh {
    my $class = shift;
    my %args = @_;

    my $db;
    if ($args{file}) {
        P6::Util::verbose(0, "File: $args{file}\n");
        $db = P6::Util::file_2_hash(($args{file}), $db);
        $db->{attrs} ||= \%db_attrs;
    }
    else {
        ## custom
        $db = {
               dsn   => $args{dsn},
               user  => $args{user},
               pass  => $args{pass},
               attrs => $args{attrs},
              };
    }

    my $r  = $args{r};

    my $dbh_key = dbh_key($db);
    my $dbh = $cache{$dbh_key};

    return $dbh if $dbh && $dbh->ping();

    delete $cache{$dbh_key};
    $dbh->disconnect() if $dbh;

    $dbh = eval { $class->SUPER::connect($db->{dsn}, $db->{user}, $db->{pass}, $db->{attrs}) };
    if ($@) {
        if ($r) {
            $r->log_error($@);
        }
        else {
            if ($args{nonfatal}) {
                carp $@;
                print $@;
            }
            else {
                confess $@;
            }
        }
    }

    $cache{$dbh_key} = $dbh;

    return $dbh;
}

sub dbh_key {
    my ($db) = @_;

    return join '-', $db->{dsn}, $db->{user}, $db->{pass}, P6::Util::h_2_str($db->{attrs});
}

package P6::DB::db;
@P6::DB::db::ISA = qw(DBI::db);

sub prepare_log {
    my $dbh = shift;
    my ($sql) = @_;

    my $sth = $dbh->SUPER::prepare($sql);
    $sth->{private_info}->{sql} = $sql;

    return $sth;
}

*prepare = \&prepare_log if $ENV{P6_SQL_LOG};

package P6::DB::st;
@P6::DB::st::ISA = qw(DBI::st);

sub execute_log {
    my $sth = shift;
    my @params = @_;

    my $sql = $sth->{private_info}->{sql};
    my $t0;
    unless ($sql =~ /^EXPLAIN/) {
        append_to_dbi_log(P6::Util::stack_trace() . "\n");
        _log($sql, \@params);
        explain($sth->{Database}, $sql, \@params) if $sql =~ /SELECT/i;
        $t0     = [Time::HiRes::gettimeofday];
    }

    my $rv = $sth->SUPER::execute(@params);

    unless ($sql =~ /^EXPLAIN/) {
        my $delta = Time::HiRes::tv_interval($t0);
        append_to_dbi_log("$sth->{Database}\n" . $sth->{Database}->{Name} . ":" . $sth->{Database}->{Driver}->{Name} . " - Time: $delta\n\n");
    }

    return $rv;
}

sub bind_param_log {
  my ($sth, $index, $param, $type) = @_;

  my $sql = $sth->{private_info}->{sql};

  if (defined $param) {
      $sql = fill_in_params($sql, [$param]);
      $sth->{private_info}->{sql} = $sql;
  }

  return $sth->SUPER::bind_param($index, $param, $type);
}

sub fill_in_params {
    my ($sql, $params) = @_;

    foreach my $param (@$params) {
        my $neat = DBI::neat($param);
        $neat = 'NULL' if $neat =~ /^undef$/o;
        $sql =~ s/\?/$neat/;
    }

    return $sql;
}

sub explain {
    no warnings;
    my ($dbh_parent, $sql, $params) = @_;

    return if $dbh_parent->{Driver}->{Name} !~ /MySQL/i;

    $sql = fill_in_params($sql, $params);

    my $plan = "";
    eval {
        my $sth = $dbh_parent->prepare("EXPLAIN $sql");
        $sth->SUPER::execute();
        while (my @row = $sth->fetchrow_array()) {
            local $" = ", ";
            $plan .= "@row\n" if @row;
        }
        $sth->finish();
    };
    $plan .= "\n";

    append_to_dbi_log($plan);

    return;
}

sub _log {
    my ($sql, $params) = @_;

    $sql = fill_in_params($sql, $params);

    $sql =~ s/^\s*//go;
    $sql =~ s/\n\s*/\n/go;

    $sql .= "\n\n";

    append_to_dbi_log($sql);

    return;
}

sub append_to_dbi_log {
    my ($str) = @_;

    my $f = "$ENV{P6_SQL_LOG}/ALL";
    $f =~ /(.*)/; $f = $1;

    P6::IO::dappend($f, \$str);

    return;
}

if ($ENV{P6_SQL_LOG}) {
    *execute    = \&execute_log;
    *bind_param = \&bind_param_log;
}

1;

