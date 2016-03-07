#!/bin/sh -x

sudo rm -rf /usr/local /Library/Caches/Homebrew /opt/homebrew-cask

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew doctor
brew update

brew tap homebrew/versions
brew tap homebrew/dupes
brew tap homebrew/binary
brew tap caskroom/cask

## src distribution apps
base_pkgs="gpg go subversion git hub irssi nmap swaks sqlite xz graphiz"
devel_pkgs="autoconf auotmake"
db_pkgs="mysql postgresql innotop redis memcache"
devops_pkgs="awscli packer ansible docker boot2docker"

for pkg in $base_pkgs $devel_pkgs $db_pkgs $devops_pkgs; do
  brew install pkg
done

## binary distribution apps
binary_pkgs="alfred dash evernote firefox gitx google-chrome google-drive google-hangouts \
	hipchat iterm2 java r skype skitch vagrant virtualbox \
	utorrent vlc xquartz wireshark wkhtmltopdf"
brew install brew-cask
for pkg in $binary_pkgs
  brew cask install $pkg
done

brew prune
