
# ==========================================
# HISTORY
# ==========================================

HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=50000

setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY
setopt EXTENDED_HISTORY

# ==========================================
# SHELL OPTIONS
# ==========================================

setopt AUTO_CD

export DISABLE_AUTO_TITLE='true'

# ==========================================
# ENVIRONMENT
# ==========================================

export EDITOR="nvim"
export VISUAL="nvim"

# ==========================================
# FUNCTIONS
# ==========================================

mkcd() {
    mkdir -p "$1" && cd "$1"
}

# ==========================================
# CUSTOM COMMANDS
# ==========================================

alias normalize-mp3='find . -name "*.mp3" -print0 | xargs -0 -n 1 -P 4 mp3gain -r -s r -d 2.0'


# ==========================================
# ZINIT
# ==========================================
source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

autoload -Uz compinit
compinit -i

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes
zstyle ':completion:*' use-cache yes

# ==========================================
# ZINIT PLUGINS
# ==========================================

zinit light zsh-users/zsh-completions

zinit light zsh-users/zsh-autosuggestions

zinit light zdharma-continuum/fast-syntax-highlighting

# ==========================================
# STARSHIP PROMPT
# ==========================================

eval "$(starship init zsh)"



# ==========================================
# Zoxide
# # ==========================================
eval "$(zoxide init zsh)"


# ==========================================
# FZF
# ==========================================

source <(fzf --zsh)

export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border rounded"

export FZF_CTRL_T_OPTS="--preview 'batcat --color=always --style=numbers {} 2>/dev/null || cat {}'"

export FZF_ALT_C_OPTS="--preview 'eza --tree --level=2 --icons {} 2>/dev/null'"




# ==========================================
# Aliases 
# ==========================================

alias ls="eza --icons"
alias ll="eza -lah --icons --git"
alias la="eza -a --icons"
alias lt="eza --tree --level=2 --icons"

alias cat="batcat"
alias catp="batcat --plain"

alias find="fdfind"

alias grep="rg"


alias cp="cp -iv"
alias mv="mv -iv"
alias rm="rm -iv"
alias uptime="uptime --pretty"

alias c='clear && ls --color=auto -Ash'

alias copy="wl-copy"

