package P6::Object;
use parent 'P6';

## core
use strict;
use warnings FATAL => 'all';

## dist

## cpan

## custom
use P6::Util ();

## overloads

## version

## constants
use constant DATA => '_data';

## globals

## methods
sub new {
    my $class = shift;
    my %args = @_;

    $class->_init();

    my $hash = {
	DATA() => {
	    %{$class->_fields()},
	    %args,
	}
    };

    my $self = bless $hash, $class;

    $self->_post_init() if $self->can('_post_init');

    return $self;
}

sub update {
    my $self = shift;
    my %args = @_;

    $self->{DATA()} = {
	%{$self->_data()},
	%args
    };

    $self->_post_init() if $self->can('_post_init');

    return;
}

##############################################################################
#
#                           Private Functions
#
##############################################################################
sub _fields { { } }

sub _init {
    my $class = shift;

    no strict 'refs';
    return if ${$class . '::_imported'};

    my $fields = $class->_fields();
    $class->_methods_gen(fields => $fields);

    ${$class . '::_imported'} = 1;

    return;
}

sub _methods_gen {
    my $class = shift;
    my %args = @_;

    my $fields = $args{fields};

    foreach my $field_name (keys %$fields) {
	no strict 'refs';
	my $method = join '::', ($class, $field_name);

	*$method = sub {
	    my $self = shift;

	    my $old = $self->{DATA()}->{$field_name};

	    if (@_) {
		$self->{DATA()}->{$field_name} = shift;
	    }

	    return $old;
	};
    }

    return;
}

sub _data { shift->{DATA()} }

1;
