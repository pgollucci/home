#!/bin/sh -x

sudo rm -rf /usr/local /Library/Caches/Homebrew /opt/homebrew-cask

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
for pkg in awscli pyenv pyenv-virtualenv packer ansible boot2docker; do
  brew install $pkg
done

## 3rd party apps used by $work
for pkg in imagemagick netpbm geos redis; do
  brew install $pkg
done

## binary distribution apps
brew install brew-cask
for pkg in alfred dash evernote firefox gitx google-chrome google-drive google-hangouts \
	hipchat iterm2 java r skype skitch vagrant virtualbox \
	utorrent vlc xquartz wireshark wkhtmltopdf; do
  brew cask install $pkg
done

brew prune

ln -s $HOME/bin/rdesktop /usr/local/bin/rdesktop
