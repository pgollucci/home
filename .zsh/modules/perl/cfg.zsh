__setup() {

    local perl5="$HOME/perl5"

    path_if "$perl5/bin"

    PERL5LIB="$perl5/lib/perl5";             export PERL5LIB
    PERL_LOCAL_LIB_ROOT="$perl5";            export PERL_LOCAL_LIB_ROOT
    PERL_MB_OPT="--install_base \"$perl5\""; export PERL_MB_OPT
    PERL_MM_OPT="INSTALL_BASE=$perl5";       export PERL_MM_OPT
}

__setup
