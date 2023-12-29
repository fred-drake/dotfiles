# Cursor styles
set -gx fish_vi_force_cursor 1
set -gx fish_cursor_default block
set -gx fish_cursor_insert line blink
set -gx fish_cursor_visual block
set -gx fish_cursor_replace_one underscore
set -gx EDITOR (which nvim)
set -gx VISUAL $EDITOR
set -gx SUDO_EDITOR $SUDO_EDITOR

set -gx fisher_path ~/.local/share/chezmoi/home/dot_config/fish

fish_add_path $HOME/bin

set -gx GHQ_ROOT $HOME/Source

# VI Mode
function fish_user_key_bindings
    fish_vi_key_bindings
    bind -M insert -m default jk backward-char force-repaint
end

# Files & Directories
abbr mv "mv -iv"
abbr cp "cp -riv"
abbr mkdir "mkdir -vp"
alias ls="eza --color=always --icons --group-directories-first"
alias la 'eza --color=always --icons --group-directories-first --all'
alias ll 'eza --color=always --icons --group-directories-first --all --long'
abbr l ll
abbr ncdu "ncdu --color dark"

if status is-interactive
    # Commands to run in interactive sessions can go here
end

direnv hook fish | source
