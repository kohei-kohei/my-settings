# for git
autoload -Uz compinit && compinit
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
PROMPT='[%n] %c'\$vcs_info_msg_0_' %# '
precmd(){ vcs_info }

# alias
alias g='git'
alias gb='git branch'
alias ga='git add'
alias gs='git switch'
alias gp='git pull -p'
alias gf='git fetch'
alias gl='git log'
alias d='docker'
alias dcu='docker compose up -d'
alias dcd='docker compose down -v'
alias ..='cd ..'
alias ...='cd ../..'
alias ls='ls -FG'
alias la='ls -aG'
alias ll='ls -lG'
alias rm='rm -i'
alias mkdir='mkdir -p'
alias cp='cp -i'
alias c='clear'
alias sz='source ~/.zshrc'
alias vz='vim ~/.zshrc'
alias va='vim ~/.aws/config'

