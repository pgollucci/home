#!/bin/sh -x

# XXX: Doesn't install OneDrive, SQLPro for MSSQL
main() {

    sudo -v

    # Keep-alive: update existing sudo time stamp if set, otherwise do nothing.
    while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

    sudo rm -rf /usr/local /Library/Caches/Homebrew /opt/homebrew-cask ~/Applications

    yes | ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

    export PATH=/usr/local/bin:${PATH}
    brew doctor
    brew update

    brew tap homebrew/bundle

    brew bundle --file=$HOME/bin/Brewfile

    brew prune
}

main "$@"
