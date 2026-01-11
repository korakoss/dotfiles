
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZSHRC_DIR="${0:A:h}"

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(zsh-syntax-highlighting z zsh-autosuggestions) 

source $ZSH/oh-my-zsh.sh

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

[ -f "/Users/akoskorosi/.ghcup/env" ] && . "/Users/akoskorosi/.ghcup/env" # ghcup-env

export PATH="$HOME/bin:$PATH"
export PATH="$HOME/dotfiles/bin:$PATH"

source ~/.oh-my-zsh/custom/themes/catppuccin/themes/catppuccin_mocha-zsh-syntax-highlighting.zsh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# Source my custom configs 
source ~/dotfiles/zsh/aliases.zsh
source ~/dotfiles/zsh/exports.zsh

case "$(hostname)" in
    *MacBook*|mac) source "$ZSHRC_DIR/hosts/mac.zsh" ;;
    pi|raspberrypi) source "$ZSHRC_DIR/hosts/pi.zsh" ;;
esac
