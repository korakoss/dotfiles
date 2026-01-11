# Plugin overwrites
command -v eza &> /dev/null && alias ls="eza --icons"
command -v bat &> /dev/null && alias cat="bat"

# Python
alias py="python3"
alias pip="pip3"


# Git
alias ga="git add -u && git status"
alias gaa="git add ."       # git add all
alias gc="git commit -m"
alias gcv="git commit"      # verbose/vim
alias gs="git status"
alias gd="git diff"
alias gp="git push"
alias ggr="git log --oneline --all --graph"
alias gpl="git pull"


# Other
alias zshc="nvim ~/dotfiles/.zshrc"
alias zshr="exec zsh"
