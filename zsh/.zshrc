# p10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZSHRC_DIR=~/dotfiles/zsh

# Zinit
source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
zinit light romkatv/powerlevel10k
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light agkozak/zsh-z

# Completions
autoload -Uz compinit && compinit

# Editor
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

[ -f "/Users/akoskorosi/.ghcup/env" ] && . "/Users/akoskorosi/.ghcup/env"

export PATH="$HOME/bin:$PATH"
export PATH="$HOME/dotfiles/bin:$PATH"

source ~/dotfiles/zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source ~/dotfiles/zsh/aliases.zsh
source ~/dotfiles/zsh/exports.zsh
source "$ZSHRC_DIR/hooks.zsh"

case "$(hostname)" in
    *MacBook*|mac) source "$ZSHRC_DIR/hosts/mac.zsh" ;;
    pi|raspberrypi) source "$ZSHRC_DIR/hosts/pi.zsh" ;;
esac
