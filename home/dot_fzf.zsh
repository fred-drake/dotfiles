# Setup fzf
# ---------
SYSTEM=$(uname -s)
if [ "$SYSTEM" = "Darwin" ]; then
  if [[ ! "$PATH" == *$(brew --prefix)/opt/fzf/bin* ]]; then
    export PATH="${PATH:+${PATH}:}$(brew --prefix)/opt/fzf/bin"
  fi
fi

# Auto-completion
# ---------------
if [ "$SYSTEM" = "Darwin" ]; then
  [[ $- == *i* ]] && source "$(brew --prefix)/opt/fzf/shell/completion.zsh" 2> /dev/null
fi

# Key bindings
# ------------
source "$HOME/.fzf-key-bindings.zsh"
