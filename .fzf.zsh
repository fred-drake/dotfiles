# Setup fzf
# ---------
if [[ ! "$PATH" == */usr/local/Homebrew/opt/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/usr/local/Homebrew/opt/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/usr/local/Homebrew/opt/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source ".fzf-key-bindings.zsh"
