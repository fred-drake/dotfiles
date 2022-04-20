
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:"/Applications/VMware Fusion.app/Contents/Library/VMware OVF Tool":$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/fdrake/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="eastwood"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

ZSH_WEB_SEARCH_ENGINES=(
  whoogle "https://whoogle.internal.freddrake.com/search?q="
)

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  ruby
  golang
  scala
  gem
  history
  zsh-syntax-highlighting
  history-substring-search
  brew
  nanoc
  kubectl
  zsh-autosuggestions
  macos
  web-search
  sudo
  dirhistory
  docker
  docker-compose
  clipboard
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#source ~/.profile
export PATH="/usr/local/homebrew/bin:/usr/local/opt/libpcap/bin:$PATH:/Users/fdrake/bin"
alias dnsflush="sudo killall -HUP mDNSResponder"
alias flushdns="dnsflush"
alias restartkiosk='ssh kiosk "sudo systemctl stop kiosk.service && sudo systemctl start kiosk.service"'
alias chrome="/Applications/Google\\ \\Chrome.app/Contents/MacOS/Google\\ \\Chrome"
#alias k='kubectl'
#alias kga='kubectl get all'
#alias kgpo='kubectl get pods'
#alias kgi='kubectl get ingress'
#alias kgno='kubectl get nodes'
#alias kgns='kubectl get ns'
alias kdf='kubectl delete --grace-period=0 --force'
alias kdrain='kubectl drain --ignore-daemonsets --delete-emptydir-data'
alias hung-ns='kubectl api-resources --verbs=list --namespaced -o name | xargs -n 1 kubectl get --show-kind --ignore-not-found -n'
alias cdinfra='cd /Users/fdrake/Source/github/fred-drake/infrastructure'
alias cdgh='cd /Users/fdrake/Source/github/fred-drake'
#alias kresources='kubectl api-resources --verbs=list --namespaced -o name | xargs -n 1 kubectl get --show-kind --ignore-not-found -n'

alias dns_update='cd /Users/fdrake/Source/github/fred-drake/infrastructure; ansible-playbook ansible/playbooks/dns_update.yml'
alias dhcp_update='cd /Users/fdrake/Source/github/fred-drake/infrastructure; ansible-playbook ansible/playbooks/dhcp_update.yml'

alias dl='docker -H ssh://larussa'
alias d1='docker -H ssh://docker1'
alias d2='docker -H ssh://docker2'
alias d3='docker -H ssh://docker3'
alias d5='docker -H ssh://docker5'
alias d7='docker -H ssh://docker7'

export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source <(helm completion zsh)


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#export POWERLEVEL9K_INSTANT_PROMPT=off
#neofetch

export HOMEBREW_PREFIX=/usr/local/bin/homebrew
eval "$(direnv hook zsh)"
export PATH="/Applications/VMware Fusion.app/Contents/Library/VMware OVF Tool:$PATH"

source <(kubectl completion zsh)

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

