#!/bin/bash

symlink () {
    [ ! -L ~/$1 ] && ln -s ~/dotfiles/$1 ~/$1
}

privlink () {
    [ ! -L ~/$1 ] && ln -s ~/dotfiles/private/$1 ~/$1
}

echo "Extracting private files..."
gpg -do ~/dotfiles/private.tar.gz ~/dotfiles/private.tar.gz.gpg
mkdir -p ~/dotfiles/private
tar xf ~/dotfiles/private.tar.gz -C ~/dotfiles
rm -f ~/dotfiles/private.tar.gz

echo "Building symbolic links to files..."
symlink ".zprofile"
symlink ".zshrc"
symlink ".fzf.zsh"
symlink ".gitconfig"
symlink ".gitflow_export"
symlink ".cluster-api"
symlink ".p10k.zsh"
symlink ".finicky.js"
symlink ".gitignore_global"
symlink ".hgignore_global"
symlink ".fzf-key-bindings.zsh"
symlink ".oci"

privlink ".ssh"
privlink ".talos"
privlink ".appleConnect"
privlink ".vnc"
privlink ".sops"
privlink ".mc"
privlink ".docker"
privlink "bin"

echo "Install homebrew if it doesn't exist..."
[[ $(type -P "brew") ]] || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Install the brew bundle..."
brew bundle --file ~/dotfiles/Brewfile

echo "Install Alfred workflows..."
cp -a ~/dotfiles/alfred/workflows ~/Library/Application\ Support/Alfred/Alfred.alfredpreferences

echo "Installing VS Code extensions....."
cat ~/dotfiles/vs-code-extensions.txt | xargs -L 1 code --install-extension
