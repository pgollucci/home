#!/bin/sh -x

# XXX: Doesn't install OneDrive, SQLPro for MSSQL

sudo rm -rf /usr/local /Library/Caches/Homebrew /opt/homebrew-cask

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew doctor
brew update

brew tap homebrew/versions
brew tap homebrew/dupes
brew tap homebrew/binary
brew tap homebrew/x11
brew tap caskroom/cask

## src distribution apps
base_pkgs="ctags-exuberant gpg go subversion hub htop-osx irssi nmap swaks sqlite xz graphiz rdesktop"
devel_pkgs="autoconf automake"
db_pkgs="mysql postgresql innotop redis memcache"
devops_pkgs="awscli packer ansible docker boot2docker"

for pkg in $base_pkgs $devel_pkgs $db_pkgs $devops_pkgs; do
  brew install $pkg
done

brew install git --without-completions
brew install git-extras

## binary distribution apps
binary_pkgs="alfred chefdk dash evernote firefox gitx google-chrome google-drive google-hangouts \
	hipchat microsoft-lync omnigraffle iterm2 java r synergy skitch squidman  vagrant virtualbox \
	utorrent vlc xquartz wireshark wkhtmltopdf"
brew install brew-cask
for pkg in $binary_pkgs; do
  brew cask install $pkg
done

brew prune

sudo rm -f /usr/bin/ctags
