#!/bin/sh

# Battery
defaults write com.apple.menuextra.battery ShowPercent -string "NO"
defaults write com.apple.menuextra.battery ShowTime -string "NO"

# KB
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3
defaults write InitialKeyRepeat -int 12
defaults write KeyRepeat -int 1
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
defaults write NSGlobalDomain KeyRepeat -int 0

# Screen saver
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Disable disk image verification
defaults write com.apple.frameworks.diskimages skip-verify -bool true
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

# .DS_Store
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Finder
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
defaults write com.apple.finder AppleShowAllFiles YES
defaults write com.apple.finder EmptyTrashSecurely -bool true

# Dock
defaults write com.apple.dock show-process-indicators -bool true
defaults write com.apple.dock autohide -bool true





