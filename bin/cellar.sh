#!/bin/sh -x

rm -rf /usr/local/Cellar /usr/local/.git && brew cleanup

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew doctor
brew update

brew tap homebrew/versions
brew tap homebrew/dupes
brew tap homebrew/binary

for pkg in gpg go subversion git hub irssi nmap swaks xz; do
  brew install $pkg
done

for pkg in mysql postgresql innotop; do
  brew install $pkg
done

for pkg in ilibyaml pyenv packer ansible; do
  brew install $pkg
done

for pkg in imagemagick; do
  brew install $pkg
done

brew prune
