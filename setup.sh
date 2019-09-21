#!/bin/bash

SOURCE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Install Homebrew
echo "Installing Homebrew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install brew dependencies
echo "Installing brew dependencies..."
brew bundle --file="$SOURCE_DIR/Brewfile"

# Install omf
echo "Installing omf..."
curl -L https://get.oh-my.fish > install
fish install --path=~/.local/share/omf --config=~/.config/fish/omf

# Install Languages
echo "Installing languages..."
./languages.fish

# Create required symlinks
ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl
ln -s /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code /usr/local/bin/code

# Copy configs to home
echo "Copying configs..."
cp -R "$SOURCE_DIR/configs/" ~/

echo "Done"