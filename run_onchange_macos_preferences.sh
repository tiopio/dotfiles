#!/bin/bash

# Ensure this only runs on macOS
if [ "$(uname -s)" != "Darwin" ]; then
  exit 0
fi

echo "Applying macOS Dock, Menu Bar, and Finder settings..."

# --- Menu Bar ---
# Auto-hide the menu bar
defaults write NSGlobalDomain _HIHideMenuBar -bool true

# --- Dock ---
# Auto-hide the Dock
defaults write com.apple.dock autohide -bool true
# Use "scale" effect for window minimization (instead of genie)
defaults write com.apple.dock mineffect -string "scale"
# Minimize windows into their application icon
defaults write com.apple.dock minimize-to-application -bool true
# Disable the bouncing animation when opening apps
defaults write com.apple.dock launchanim -bool false
# Disable recent applications in the Dock
defaults write com.apple.dock show-recents -bool false

# --- Finder ---
# Show all hidden files
defaults write com.apple.finder AppleShowAllFiles -bool true
# Show all file extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# Hide all items on the desktop
defaults write com.apple.finder CreateDesktop -bool false
# Set default Finder window to Home directory (PfHm)
defaults write com.apple.finder NewWindowTarget -string "PfHm"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"
# Set default Finder view to List View (Nlsv)
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# --- Apply Changes ---
# Restart affected services so changes take effect immediately
killall Dock
killall Finder
killall SystemUIServer

echo "macOS settings applied successfully."
