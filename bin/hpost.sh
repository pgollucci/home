#!/bin/sh

main() {

    $HOME/bin/hcellar.sh
    $HOME/bin/hdefaults.sh
    $HOME/bin/hlangs.sh install
    $HOME/bin/hpip.sh
    $HOME/bin/hcpan.sh
    $HOME/bin/repos-mine.zsh
    $HOME/bin/hmisc.sh
}

main "$@"
exit $?

