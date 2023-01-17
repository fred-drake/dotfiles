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
alias cdinfra='cd ~/Source/github/fred-drake/infrastructure'
alias cdgh='cd ~/Source/github/fred-drake'
#alias kresources='kubectl api-resources --verbs=list --namespaced -o name | xargs -n 1 kubectl get --show-kind --ignore-not-found -n'

alias dns_update='cd ~/Source/github/fred-drake/infrastructure; ansible-playbook ansible/playbooks/dns_update.yml'
alias dhcp_update='cd ~/Source/github/fred-drake/infrastructure; ansible-playbook ansible/playbooks/dhcp_update.yml'

alias dl='docker -H ssh://larussa'
alias d1='docker -H ssh://docker1'
alias d2='docker -H ssh://docker2'
alias dn8='docker -H ssh://nuc8'
alias d5='docker -H ssh://docker5'
alias dn9='docker -H ssh://nuc9'
alias ds='docker -H ssh://rp2'
alias dss='docker -H ssh://rp2 service'
alias dsdrain='docker -H ssh://rp2 node update --availability drain'
alias dsactive='docker -H ssh://rp2 node update --availability active'
alias wdssls='watch -n 2 docker -H ssh://rp2 service ls'

#alias docker='nerdctl'
alias lg='lazygit --use-config-file ~/.config/lazygit/config.yml'
alias vi='lvim'
alias infradocker='docker run -it --rm --name infrastructure -v ~/Source/github/fred-drake/infrastructure:/workspaces/infrastructure -v ~/.gnupg:/root/.gnupg infrastructure /bin/bash'
alias ls='lsd'
alias ssh='kitty +kitten ssh'

alias cm='chezmoi'
alias cmu='chezmoi update'
alias cma='chezmoi apply'

alias cp='cp -i'
alias df='df -h'

alias main='tmux new-session -A -s main'
