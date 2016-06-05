#!/bin/sh -x

# XXX: Doesn't install OneDrive, SQLPro for MSSQL

sudo rm -rf /usr/local /Library/Caches/Homebrew /opt/homebrew-cask

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew doctor
brew update

brew tap homebrew/bundle

brew bundle --file=$HOME/bin/Brewfile

brew prune
