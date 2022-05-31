#!/bin/bash

echo "Exporting VS Code extensions list..."
code --list-extensions > ~/dotfiles/vs-code-extensions.txt

echo "Exporting homebrew package list..."
brew bundle dump --describe --file ~/dotfiles/Brewfile --force

echo "Exporting Alfred workflows..."
rm -rf ~/dotfiles/alfred/workflows
cp -a ~/Library/Application\ Support/Alfred/Alfred.alfredpreferences/workflows ~/dotfiles/alfred

echo "Packaging and encrypting private files archive..."
cd ~/dotfiles
tar czf private.tar.gz private/
gpg --batch --yes -er fred.drake@gmail.com private.tar.gz
rm -f private.tar.gz
