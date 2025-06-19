export PATH="$HOME/.local/bin:$PATH"
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/config.json)"

if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

# Plugins 
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

autoload -U compinit && compinit

# Key Bindings
bindkey '^f' autosuggest-accept    # Ctrl F
bindkey "^[[H" beginning-of-line   # Home key
bindkey "^[[F" end-of-line         # End key

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

setopt correct

#Aliases
alias ls='eza --icons=auto'
alias update='sudo pacman -Syu && flatpak update'

#Path
export PATH="$PATH:$HOME/.cargo/bin"
