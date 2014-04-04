#!/bin/sh

ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

brew doctor
brew update

brew tap homebrew/versions
brew tap homebrew/dupes

for pkg in git hub irssi nmap rdesktop swaks wireshark xz; do
  brew install $pkg
done

brew prune
