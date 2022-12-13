# .zshrc
export TERM="xterm-256color"

# To profile performance uncomment the below line and call `zprof` after sourcing.
# zmodload zsh/zprof

#   ---------------------------------------
#   1.  ZSH Plugin Manager
#   ---------------------------------------
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ -d "${ZINIT_HOME}" ]
    then
        source "${ZINIT_HOME}/zinit.zsh"
else mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
    source "${ZINIT_HOME}/zinit.zsh"   
fi

#   -----------------------------
#   2.  USER CONFIGURATION
#   -----------------------------
export DEFAULT_USER=$USER
export EDITOR="nvim"
export MANPAGER="nvim +Man!"
export NVM_LAZY_LOAD=true
export NVM_COMPLETION=true
export NVM_DIR=$HOME/.nvm

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use # This loads nvm

# ZSH Options
CASE_SENSITIVE="false"
HYPHEN_INSENSITIVE="true"
DISABLE_AUTO_UPDATE="false"
export UPDATE_ZSH_DAYS=2
DISABLE_LS_COLORS="true"
DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="yyyy-mm-dd"

setopt APPENDHISTORY          # Append to history instead of replacing it
setopt AUTO_CD                # `cd` to directories by just giving the directory by itself
setopt EXTENDED_HISTORY       # Extended history format
setopt HIST_EXPIRE_DUPS_FIRST # Expire duplicate entries first when trimming history.
setopt HIST_FIND_NO_DUPS      # Do not display a line previously found.
setopt HIST_IGNORE_ALL_DUPS   # Delete old recorded entry if new entry is a duplicate.
setopt HIST_IGNORE_DUPS       # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_SPACE      # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS      # Don't write duplicate entries in the history file.
setopt INC_APPEND_HISTORY     # Write to the history file immediately, not when the shell exits.
setopt INTERACTIVE_COMMENTS   # escape commands so i can use them later (allow comments after commands)
setopt LIST_TYPES             # Show types in completion
setopt NO_BEEP                # I hate beeps
setopt PROMPT_SUBST           # Enable parameter expansion, command substitution, and arithmetic expansion in the prompt
setopt SHARE_HISTORY          # Share history between all sessions.
 
autoload colors
colors

zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'

# Source other files
source ~/.zsh/.secret_zsh
source ~/Config/zsh/.functions.zsh
source ~/Config/zsh/.aliases.zsh

fpath[1,0]=$HOME/.zsh/completion

# The following lines were added by compinstall
zstyle :compinstall filename '/Users/andy/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

#   ---------------------------------------
#   3.  FZF Config.
#   ---------------------------------------

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [ -x "$(command -v apt-get)" ] || [ -x "$(command -v dnf)" ]; then
    export FZF_DEFAULT_COMMAND='fdfind --type file --follow --hidden --exclude .git'
elif [ -x "$(command -v pacman)" ]; then
    export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git'
fi

local background="#0b0d0f"
local current_line="#131a20"
local selection="#131a20"
local foreground="#f8f8f2"
local comment="#6272a4"
local cyan="#8be9fd"
local green="#50fa7b"
local orange="#ffb86c"
local pink="#ff79c6"
local purple="#bd93f9"
local red="#ff5555"
local yellow="#f1fa8c"

export FZF_COMPLETION_TRIGGER='**'
# For Dracula
export FZF_DEFAULT_OPTS="
  --height 40%
  --layout=reverse
  --border
  --preview '(highlight -O ansi -l {} 2> /dev/null || bat --style=numbers --color=always {} || tree -C {}) 2> /dev/null | head -200'
  --color=dark
  --color fg:-1,bg:$background,hl:$green,fg+:$foreground,bg+:$current_line,hl+:$pink
  --color info:$comment,prompt:$green,spinner:$green,pointer:$cyan,marker:$pink,header:$purple
  --bind tab:down
  --cycle
"
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null ||  bat --style=numbers --color=always {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"

zstyle ':fzf-tab:*' command $FZF_TAB_COMMAND

export FZFZ_RECENT_DIRS_TOOL='zfr'
export FZFZ_PREVIEW_COMMAND='exa --tree --git --icons {}'

# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa --icons --color-scale --tree -D $realpath'
# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'
# vscode previews for files
zstyle ':fzf-tab:complete:code:**' fzf-preview 'bat $realpath || exa --icons --color-scale --tree -D $realpath'

zstyle ':fzf-tab:*' command $FZF_TAB_COMMAND

#   ---------------------------------------
#   4.  Misc.
#   ---------------------------------------

# Hub Wrapper Init
eval "$(hub alias -s)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# ssh-agent Management
if [ -f ~/.ssh/agent.env ]; then
    . ~/.ssh/agent.env >/dev/null
    if ! kill -0 $SSH_AGENT_PID >/dev/null 2>&1; then
        echo "Stale agent file found. Spawning new agent… "
        eval $(ssh-agent | tee ~/.ssh/agent.env)
        ssh-add
    fi
else
    echo "Starting ssh-agent"
    eval $(ssh-agent | tee ~/.ssh/agent.env)
    ssh-add
fi

[ -s "/home/andy/.jabba/jabba.sh" ] && source "/home/andy/.jabba/jabba.sh"

# Rocket Man
eval "$(starship init zsh)"

# kubectl autocomplete
if [ /usr/bin/kubectl ]; then source <(kubectl completion zsh); fi

# Poetry and Pyenv

if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init --path)"
    eval "$(pyenv init -)"
fi

fpath[1,0]=$HOME/.zsh/completion

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).
export PATH="/opt/homebrew/opt/openssl@1.1/bin:$PATH"

eval "$(zoxide init zsh)"

#   ---------------------------------------
#   5.  ZSH Load Plugins
#   ---------------------------------------
zinit from"gh-r" as"program" mv"direnv* -> direnv" \
    atclone'./direnv hook zsh > zhook.zsh' atpull'%atclone' \
    pick"direnv" src="zhook.zsh" for \
        direnv/direnv

zinit wait lucid light-mode for \
  atinit"zicompinit; zicdreplay" \
      zdharma-continuum/fast-syntax-highlighting \
  atload"_zsh_autosuggest_start" \
      zsh-users/zsh-autosuggestions \
  blockf atpull'zinit creinstall -q .' \
      zsh-users/zsh-completions
