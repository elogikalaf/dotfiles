# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# adding home/elo/bin for ruby gem programs and oh-my-posh
export PATH="/home/elo/bin:$PATH"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"


# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# Init oh-my-posh
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/base.yaml)"

# use vim Keybindings
bindkey -v

# Keybindings
bindkey '^[w' kill-region
# history search with up or down command
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases
alias ls='ls --color'

# adding all aliases
. ~/.aliases

# o3Login
o3Login() {
    response=$(curl -H "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7" \
        -H "Accept-Language: en-US,en;q=0.9,fa;q=0.8" \
        -H "Cache-Control: max-age=0" \
        -H "Connection: keep-alive" \
        -H "Content-Type: application/x-www-form-urlencoded" \
        -H "Origin: https://192.168.12.1" \
        -H "Referer: https://192.168.12.1/login?" \
        -H "Sec-Fetch-Dest: document" \
        -H "Sec-Fetch-Mode: navigate" \
        -H "Sec-Fetch-Site: same-origin" \
        -H "Sec-Fetch-User: ?1" \
        -H "Upgrade-Insecure-Requests: 1" \
        -H "User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36" \
        -H "sec-ch-ua: 'Chromium';v='118', 'Google Chrome';v='118', 'Not=A?Brand';v='99'" \
        -H "sec-ch-ua-mobile: ?0" \
        -H "sec-ch-ua-platform: 'Linux'" \
        --data-raw "dst=&popup=true&username=4311453620&password=51vPJEtX" \
        --compressed --insecure https://192.168.12.1/login -s)

    h1_content=$(echo "$response" | awk -F'</h1>' '/<h1>/{print $1}' | awk -F'<h1>' '{print $NF}')

    echo "$h1_content"
}


# pnpm
export PNPM_HOME="/home/elo/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# reverse search
bindkey "^R" history-incremental-search-backward

# thefuck
eval $(thefuck --alias)

################# configuring PATH
# adding cargo
export PATH="/home/elo/.cargo/bin:$PATH"
#adding .local/bin
export PATH="/home/elo/.local/bin:$PATH"
# add spicetify
export PATH=$PATH:/home/elo/.spicetify
################ done configuring PATH

## set editor to vim
export EDITOR="/usr/bin/nvim"

## cheatsh alias 
cheatsh() {
    curl cheat.sh/"$1"
}


