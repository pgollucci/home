package P6::MVC::M;

## core
use strict;
use warnings FATAL => 'all';
use Carp;

## mp2

## libapreq2

## dist

## cpan
use DBI ();

## custom
use P6 ();
use P6::Cache ();
use P6::Conf ();
use P6::Util ();
use P6::MVC::Util::DB ();

## version
our $VERSION = q$Revision: 48229 $;

## constants
use constant DATA => '_data';
use constant DIRTY => '_dirty';

## globals
our @ISA = qw(P6);

sub new {
    my $class = shift;
    my %args = @_;

    $class->_init();

    my $self = {
                DATA() => \%args,
                DIRTY() => {},
               };

    bless $self, $class;

    $self->cache();

    return $self;
}

sub load {
    my $class = shift;
    my %args = @_;

    $class->_init();

    my $obj = P6::Cache->get(namespace => $class, keys => $class->new(%args)->_cache_keys());
    return $obj if $obj;

    my $dbh = P6::MVC::Util::DB->dbh(model => $class);

    my $href;
    if (exists $args{$class->pkey()}) {
        my $sth = $dbh->prepare_cached($class->_sql_select_by_pkey());
        $sth->execute($args{$class->pkey()});
        $href = $sth->fetchrow_hashref();
        $sth->finish();
    }
    else {
        my $sth = $dbh->prepare_cached($class->_sql_select_by_custom(%args));
        $sth->execute(_hash_2_sql_values(%args));
        $href = $sth->fetchrow_hashref();
        $sth->finish();
    }
    my $rc = $dbh->disconnect();

    if (keys %$href) {
        $obj = $class->new(%$href);
        P6::Cache->insert(obj => $obj, namespace => $class, keys => $obj->_cache_keys());
    }

    return $obj;
}

sub search {
    my $class = shift;
    my %args = @_;

    $class->_init();

    my $objs;
    my $dbh = P6::MVC::Util::DB->dbh(model => $class);
    my $sth =  $dbh->prepare_cached($class->_sql_select_by_custom(%args));
    $sth->execute(_hash_2_sql_values(%args));
    while (my $href= $sth->fetchrow_hashref()) {
      my $obj = $class->new(%$href);
      P6::Cache->insert(obj => $obj, namespace => $class, keys => $obj->_cache_keys());
      push @$objs, $obj;
    }
    $sth->finish();

    my $rc = $dbh->disconnect();

    return $objs;
}

sub all {
    my $class = shift;

    $class->search();
}

sub find {
    my $class = shift;
    my $args = shift;
    my $prefs = shift;

    my $obj = $class->load(%$args);

    unless ($obj) {
        $obj = $class->new(%$args);
	$obj->nocache() if $prefs->{nocache};
        $obj->save();
    }

    return $obj;
}

sub save {
    my $self = shift;
    my %args = @_;

    my $dbh = P6::MVC::Util::DB->dbh(model => ref $self);
    my $sth = $dbh->prepare_cached($self->_sql_insert());
    my $rc = $sth->execute(@{$self->_vals()});
    $sth->finish();

    my $fields = $self->_fields();
    my $normalized_pkey = $self->pkey();
    my $pkey = exists $fields->{$normalized_pkey} ? $normalized_pkey : 'id';

    $self->{DATA()}->{$pkey} = $dbh->last_insert_id(undef, undef, undef, undef);
    my $rv = $dbh->disconnect();
    $self->_dclear();

    P6::Cache->insert(obj => $self, namespace => ref($self), keys => $self->_cache_keys());

    return $rc;
}

sub update {
    my $self = shift;
    my %args = @_;

    my $dbh = P6::MVC::Util::DB->dbh(model => ref $self);
    my $sth = $dbh->prepare_cached($self->_sql_update());
    my $rc = $sth->execute($self->_dvals());
    $sth->finish();
    my $rv = $dbh->disconnect();

    $self->_dclear();

    return $rc;
}

sub db { no strict 'refs'; ${$_[0] . '::_db'} }

sub plural { 1 }

sub table {
    my $proto = shift;

    my $class = ref($proto) || $proto;

    my $model = (split /::/, $class)[-1];
    if ($class->plural()) {
        $model =~ s/y$/ie/;
        $model .= 's';
    }
    $model = lcfirst $model;

    while ($model =~ s/([A-Z])/\_\l$1/g) { }

    return $model;
}

sub pkey {
    my $proto = shift;

    my $class = ref($proto) || $proto;

    my $model = (split /::/, $class)[-1];
    $model = lcfirst $model;
    while ($model =~ s/([A-Z])/\_\l$1/g) { }

    return "$model\_id";
}

sub indexes {
    my $proto = shift;

    my $class = ref($proto) || $proto;

    no strict 'refs';
    return ${$class . '::_indexes'};
}

sub uniques {
    my $proto = shift;

    my $class = ref($proto) || $proto;

    no strict 'refs';
    return ${$class . '::_uniques'};
}

sub cache { shift->{cache} = 1 }
sub nocache { shift->{cache} = 0 }
sub cacheable { shift->{cache} }

sub what {
    my $class = shift;

    no strict 'refs';
    if (@_) {
        my $what = shift;
        ${$class . '::_what'} = $what;
        P6::Util::debug("${class}::_what -> $what\n");
        return;
    }
    else {
        my $what =  ${$class . '::_what'};
        return $what || $P6::MVC::M::_what;
    }
}

##############################################################################
#
#                           Private Functions
#
##############################################################################
sub _init {
    my $class = shift;

    no strict 'refs';
    return if ${$class . '::_imported'};

    $class->_dbcred_load();
    my $fields = $class->_fields();
    ${$class . '::_fields'} = $fields;
    $class->_methods_gen(fields => $fields);
    $class->_indexes_load();

    ${$class . '::_imported'} = 1;

    return;
}

sub _dbcred_load {
    my $class = shift;

    my $table = $class->table();
    my $what = $class->what();

    no warnings qw(uninitialized);
    my $dsn_e  = "$P6::Conf::DBPWS/$what";
    my $dsn_t  = "$P6::Conf::DBPWS/$what.$table";
    my $dsn_a  = "$P6::Conf::DBPWS/$what._APP";

    my $db;
    if (-r $dsn_e) {
        P6::Util::debug("$table -> $dsn_e\n");
        $db = P6::Util::dbcred_load($dsn_e);
    }
    elsif (-r $dsn_t) {
        P6::Util::debug("$table -> $dsn_t\n");
        $db = P6::Util::dbcred_load($dsn_t);
    }
    elsif (-r $dsn_a) {
        P6::Util::debug("$table -> $dsn_a\n");
        $db = P6::Util::dbcred_load($dsn_a);
    }
    else {
        die "ERROR: dsn: $table -> $dsn_e || $dsn_t || $dsn_a\n";
    }

    no strict 'refs';
    ${$class . '::_db'} = $db;

    return;
}

sub _methods_gen {
    my $class = shift;
    my %args = @_;

    my $fields = $args{fields};

    foreach my $field_name (keys %$fields) {
        my $field = $fields->{$field_name};

        no strict 'refs';
        my $method = join '::', ($class, $field_name);

        *$method = sub {
            my $self = shift;

            my $old = $self->{DATA()}->{$field_name};

            if (scalar @_) {
                $self->{DATA()}->{$field_name} = shift;
                $self->{DIRTY()}->{$field_name} = $old;
            }

            return $old;
        };
    }

    my $pkey = $class->pkey();
    no strict 'refs';
    my $m_id = $class . "::id";
    my $m_pkey = $class . '::' . $pkey;

    *$m_pkey = \&$m_id if defined *$m_id;

    return;
}

sub _fields {
    my $proto = shift;

    my $class = ref($proto) || $proto;

    no strict 'refs';
    return ${$class . '::_fields'} if ${$class . '::_fields'};

    my $dbh = P6::MVC::Util::DB->dbh(model => $class);
    my $fields = $dbh->selectall_hashref($class->_sql_desc(), 'field');
    my $rc = $dbh->disconnect();

    return $fields;
}

sub _indexes_load {
    my $class = shift;

    my $dbh = P6::MVC::Util::DB->dbh(model => $class);
    my $sth = $dbh->prepare_cached($class->_sql_indexes());
    $sth->execute();
    my $indexes = ();
    my $uniques = ();
    while (my $href = $sth->fetchrow_hashref()) {
        if ($href->{key_name} eq 'PRIMARY' || $href->{non_unique} == 0) {
            push @{$uniques->{$href->{key_name}}}, $href->{column_name};
        }
        push @{$indexes->{$href->{key_name}}->{cols}}, $href->{column_name};
        $indexes->{$href->{key_name}}->{unique} = !$href->{non_unique};
    }
    $sth->finish();
    my $rc = $dbh->disconnect();

    no strict 'refs';
    ${$class . '::_indexes'} = $indexes;
    ${$class . '::_uniques'} = $uniques;

    return;
}

sub _cache_keys {
    my $self = shift;

    my $u = $self->uniques();
    my %keys = ();

    foreach my $key_name (keys %$u) {
        my $ordinals = $u->{$key_name};
        no warnings qw(uninitialized);
        $keys{join '$', @$ordinals} = join '$', map { $self->$_() } @$ordinals;
    }

    return \%keys;
}

sub _hash_2_conditions {
    my %args = @_;

    return join "\nAND ", map { ($_ eq 'key' ? "`$_`" : $_) . " = ?" } sort { lc $a cmp $b } keys %args;
}

sub _hash_2_sql_values {
    my %args = @_;

    return map { $args{$_} } sort { lc $a cmp $b } keys %args;
}

sub _data  { shift->{DATA()}  }
sub _dirty { shift->{DIRTY()} }

sub _qs   { join ',', map { '?' } keys %{shift->_data()} }
sub _cols { join ',', sort { lc $a cmp lc $b } keys %{shift->_data()} }
sub _vals {
    my $self = shift;

    my $data = $self->_data();
    my @vals = map { $data->{$_} } sort { lc $a cmp lc $b } keys %$data;

    return \@vals;
}
sub _dclear { shift->{DIRTY()} = {} }

sub _dcols {

    my $str = join ' = ?,', sort { lc $a cmp lc $b } keys %{shift->_dirty()};
    $str =~ s/\,$//;

    return $str;
}

sub _dvals {
    my $self = shift;

    my $dirty = $self->_dirty();
    my $data  = $self->_data();
    my @vals = map { $data->{$_} } sort { lc $a cmp lc $b } keys %$dirty;

    return \@vals;
}

sub _sql_insert {
    my $self = shift;

    my $table = $self->table();
    my $qs = $self->_qs();
    my $cols = $self->_cols();

    my $str = <<END_SQL;
INSERT INTO $table
($cols)
VALUES
($qs)
END_SQL
}

sub _sql_select_by_pkey {
    my $class = shift;

    my $table = $class->table();
    my $pkey  = $class->pkey();

    my $str = <<END_SQL
SELECT *
FROM $table
WHERE $pkey = ?
END_SQL
}

sub _sql_select_by_custom {
    my $class = shift;
    my %args = @_;

    my $table = $class->table();
    my $conditions = _hash_2_conditions(%args);

    my $str = <<END_SQL;
SELECT *
FROM $table
END_SQL

    $str .= "WHERE $conditions" if $conditions;

    $str;
}

sub _sql_desc {
    my $class = shift;

    my $table = $class->table();

    my $str = <<END_SQL;
DESC $table
END_SQL
}

sub _sql_indexes {
    my $class = shift;

    my $table = $class->table();

    my $str = <<END_SQL;
SHOW INDEXES FROM $table
END_SQL
}

sub _sql_update {
    my $self = shift;

    my $table = $self->table();
    my $pkey  = $self->pkey();
    my $dcols = $self->_dcols();

    my $str = <<END_SQL;
UPDATE $table
SET
$dcols
WHERE $pkey = ?
END_SQL
}


1;
