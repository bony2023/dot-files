#!/bin/bash

SOURCE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install brew dependencies
brew bundle --file="$SOURCE_DIR/Brewfile"

# Copy configs to home
cp -R "$SOURCE_DIR/configs/" ~/

# Install omf
curl -L https://get.oh-my.fish > install
fish install --path=~/.local/share/omf --config=~/.config/fish/omf

# Pip and other utilities
sudo easy_install pip
sudo pip install --upgrade virtualenv
sudo pip install --upgrade setuptools

# Create required symlinks
ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl
ln -s /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code /usr/local/bin/code