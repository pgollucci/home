package P6::Const;

## core
use strict;
use warnings FATAL => 'all';
use Carp;

## custom

## exit codes
use constant EXIT_FAILED                     => -1;
use constant EXIT_SUCCESS                    => 0;
use constant EXIT_FAILED_INVALID_ARGS_OR_ENV => 1;
use constant EXIT_DB_FAILURE                 => 2;

use constant EXIT_ALLOWED => EXIT_SUCCESS;
use constant EXIT_DENIED  => 4;

use constant DEBUGGING => defined $ENV{P6DEBUG} && $ENV{P6DEBUG} == 1 ? 1 : 0;

use constant PORT_SSH => 22;
use constant SSH_TIMEOUT => 1;

our $tmpl_config = {
                    EVAL_PERL    => 1,
                    ABSOLUTE     => 1,
                    RELATIVE     => 1,
                   };

1;
