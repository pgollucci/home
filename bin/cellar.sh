#!/bin/sh -x

rm -rf /usr/local/Cellar /usr/local/.git && brew cleanup && brew cask cleanup
rm -rf /usr/local

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew doctor
brew update

brew tap homebrew/versions
brew tap homebrew/dupes
brew tap homebrew/binary
brew tap caskroom/cask

## base utilities
for pkg in gpg go subversion git hub irssi nmap swaks xz; do
  brew install $pkg
done

## dbs and tools
for pkg in mysql postgresql innotop; do
  brew install $pkg
done

## aws, docker, packer ansible
for pkg in pyenv packer ansible; do
  brew install $pkg
done

## 3rd party apps used by $work
for pkg in imagemagick netpbm; do
  brew install $pkg
done

## binary distribution apps
brew install brew-cask
for pkg in alfred aquamacs gitx google-chrome google-drive google-hangouts \
	hipchat iterm2 java skype skitch vagrant virtualbox \ 
	xquartz wireshark wkhtmltopdf; do
  brew cask install $pkg
done

brew prune
