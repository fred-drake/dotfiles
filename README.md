# Dotfiles

The goal is to have a single source of truth for personal machine configuration, whether it be a Macbook, Mac desktop, or Linux desktop.

## Technologies used in these dotfiles

- [Chezmoi](https://www.chezmoi.io/) for dotfiles management, using [AGE](https://github.com/FiloSottile/age) for secrets encryption
- [Alacritty](https://github.com/alacritty/alacritty) terminal emulator
- [Lazygit](https://github.com/jesseduffield/lazygit) TUI for git management
- [Lunarvim](https://www.lunarvim.org/) as my text and coding editor
- ZSH instead of Bash, with the [Oh My Zsh](https://ohmyz.sh/) framework and [Powerlevel10K](https://github.com/romkatv/powerlevel10k) theme

### Mac-specific technologies
- [Homebrew](https://brew.sh/) package manager
- [Sketchybar](https://github.com/FelixKratz/SketchyBar) bar replacement
- [Simple Hotkey Daemon](https://github.com/koekeishiya/skhd) for detailed hotkey management
- [Yabai](https://github.com/koekeishiya/yabai) window manager for MacOS


# Installation From Scratch

## MacOS

1. Install Homebrew
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

2. Manually copy the AGE private key into the `~/.age` directory
```bash
cd ~/.age && cp SOURCE_LOCATION ~/.age/personal-key.txt
```

3. Install chezmoi
```bash
brew install chezmoi
```

4. Pull the dotfiles repo
```bash
chezmoi init https://github.com/fred-drake/dotfiles
```

4. Install the dotfiles using the one time location of the config file (since the default hasn't been placed yet)
```bash
chezmoi -c ~/.local/share/chezmoi/dot_config/chezmoi/chezmoi.toml apply
```
