# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"


# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# add ~/bin for ohmyposh and ruby gems exetubales
export PATH="/home/elo/.local/bin:$PATH"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting ## code zsh-syntax-highlighting
zinit light zsh-users/zsh-completions # automatcially load completetion for example for go
zinit light zsh-users/zsh-autosuggestions # show suggestions based on history
zinit light Aloxaf/fzf-tab # fuzzy find when tab autocomplete
zinit light MichaelAquilina/zsh-auto-notify # auto-notify whnen a command is done running
zinit light MichaelAquilina/zsh-you-should-use # tell me if an alias is there for this command

# Add in snippets, basically installs plugins from a url or a namespce
zinit snippet OMZP::git # installs the git autocomplete and aliases from oh my zsh
zinit snippet OMZP::sudo # execute with sudo by pressing esc twice
zinit snippet OMZP::command-not-found ## allows zsh to suggest intalling a command if not found
zinit snippet OMZP::dnf ## autocomplete and aliases for dnf
zinit snippet OMZP::aliases ## lets you organize aliases with the als command

# Load completions
autoload -Uz compinit && compinit

# performance gain, suggested by the doc, idk what it does
zinit cdreplay -q

# Init oh-my-posh
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/base.yaml)"

# use vim Keybindings
bindkey -v
bindkey "^H" backward-delete-char
bindkey "^?" backward-delete-char

# Keybindings
bindkey '^[w' kill-region

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase # erases duplicatess
setopt appendhistory # basially zsh appends instead of overwriting
setopt sharehistory # shares command history between multiple sessions
setopt hist_ignore_space 
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' # case insensitive when using tab autocomplete
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}" # use ls colors for autocomplete
zstyle ':completion:*' menu no # disables the deafult zsh autocomplete tab so it can be replaced with fzf
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath' # allows to autocomplete fzf 

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
        --data-raw "dst=&popup=true&username=4311453620&password=*" \
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
#

# add Apps home dir 
export MYAPPS_HOME="/home/elo/Apps/"
export PATH="$PATH:"
# end Apps home dir

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

# zoxide 
eval "$(zoxide init zsh)"

# history search with up or down command
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[0A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down
bindkey "^[0B" down-line-or-beginning-search # Down


