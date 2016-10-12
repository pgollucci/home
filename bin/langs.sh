#!/bin/sh

pyenv install 2.7.12
pyenv install 3.5.2

rbenv install 1.9.3-p551
rbenv install 2.1.9
rbenv install 2.2.5
rbenv install 2.3.1
rbenv install 2.4.0-preview2

plenv install 5.18.3
plenv install 5.19.11
plenv install 5.20.2
plenv install 5.21.11
plenv install 5.22.2
plenv install 5.23.9
plenv install 5.24.0
plenv install 5.25.5

goenv install 1.2.2
goenv install 1.3.3
goenv install 1.4.3
goenv install 1.5.4
goenv install 1.6.3
goenv install 1.7.2

brew cask install java6
brew cask install java7
brew cask install java
brew cask install jav9-beta

(
    cd /Library/Java/JavaVirtualMachines
    for d in $(ls -d *); do
	jenv add /Library/Java/JavaVirtualMachines/$d/Contents/Home
    done
)
