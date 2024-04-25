# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="af-magic"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# use ps1
# export PS1='%F{6}%n%f@%F{2}%m%f:%F{3;1}%~%f\$$(git_prompt_info)'
export PS1="${FG[237]}\${(l.\$(afmagic_dashes)..-.)}%{$reset_color%}
${FG[032]}%~\$(git_prompt_info)\$(hg_prompt_info) ${FG[105]}%(!.#.»)%{$reset_color%} "


# use vim motions
bindkey -v
export KEYTIMEOUT=1

# using vim keys in tab complete manu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# editting comand lines in vim
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# adding all aliases
. ~/.aliases



# Codon compiler path (added by install script)
export PATH=/home/elo/.codon/bin:$PATH

# add cargo
export PATH=/home/elo/.cargo/bin:$PATH

# adding backwards search
bindkey -v
bindkey '^R' history-incremental-search-backward

# fuck 
eval $(thefuck --alias)

# remove meta tags
rmMetaTags() {
    if [ $# -eq 1 ]; then
        if [ -e "$1" ]; then
            cp "$1" ~/elo/apps/metatagsdelete.sh
            chmod +x ~/elo/apps/metatagsdelete.sh
            ~/elo/apps/metatagsdelete.sh
        else
            echo "Error: The input file or directory does not exist."
        fi
    else
        echo "Usage: removeMetaTags <file_or_directory>"
    fi
}

# add .local/bin to PATH
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# spitcetify
export PATH=$PATH:/home/elo/.spicetify

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

export PATH=$PATH:/usr/bin/gcc


# add brew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# lfs partition
export LFS=/mount/lfs


# pnpm
export PNPM_HOME="/home/elo/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end