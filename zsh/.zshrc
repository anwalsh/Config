# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# .zshrc
export TERM="xterm-256color"
#   -----------------------------
#   1.  USER CONFIGURATION
#   -----------------------------

ZSH_DISABLE_COMPFIX=true

autoload -U compinit
fpath+=~/.zfunc
compinit

# ------------------------------
# Exports
# ------------------------------
export DEFAULT_USER=$USER
export EDITOR="nvim"
export MANPAGER="nvim +Man!"
export NVM_DIR=$HOME/.nvm

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use # This loads nvm

# ZSH_THEME="powerlevel10k/powerlevel10k"

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

setopt HIST_IGNORE_DUPS       # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS   # Delete old recorded entry if new entry is a duplicate.
setopt HIST_IGNORE_SPACE      # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS      # Don't write duplicate entries in the history file.
setopt EXTENDED_HISTORY       # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY     # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY          # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST # Expire duplicate entries first when trimming history.
setopt prompt_subst           # enable parameter expansion, command substitution, and arithmetic expansion in the prompt
setopt transient_rprompt      # only show the rprompt on the current prompt
autoload colors
colors

zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'

# Plugins for ZSH
plugins=(tmux git zsh-completions docker golang python kubectl npm pip vagrant history rust rustup cargo terraform zsh-syntax-highlighting z)
# Source ZSH
source $ZSH/oh-my-zsh.sh

# Source other files
source ~/.zsh/.secret_zsh
source ~/Config/zsh/.functions.zsh
source ~/Config/zsh/.aliases.zsh

# Source FZF
source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/doc/fzf/examples/completion.zsh

#   ---------------------------------------
#   2.  FZF Config.
#   ---------------------------------------

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [ -x "$(command -v apt-get)" ] || [ -x "$(command -v dnf)" ]; then
    export FZF_DEFAULT_COMMAND='fdfind --type file --follow --hidden --exclude .git'
elif [ -x "$(command -v pacman)" ]; then
    export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git'
fi
export FZF_COMPLETION_TRIGGER='**'
export FZF_DEFAULT_OPTS="
    --height 40% --layout=reverse --border
    --preview '(highlight -O ansi -l {} 2> /dev/null || bat --style=numbers --color=always {} || tree -C {}) 2> /dev/null | head -200'
    --color=dark
    --color=fg:-1,bg:-1,hl:#8957e5,fg+:#E4E6EB,bg+:#0d1117,hl+:#8957e5
    --color=info:#3fb950,prompt:#1f6feb,pointer:#f85149,marker:#6e7681,spinner:#1f6feb,header:#1f6feb
    --bind tab:down --cycle
"
# OneDark
# --color=fg:-1,bg:-1,hl:#c678dd,fg+:#ffffff,bg+:#4b5263,hl+:#d858fe
# --color=info:#98c379,prompt:#61afef,pointer:#be5046,marker:#e5c07b,spinner:#61afef,header:#61afef

export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null ||  bat --style=numbers --color=always {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"

zstyle ':fzf-tab:*' command $FZF_TAB_COMMAND

export FZFZ_RECENT_DIRS_TOOL='zi'
export FZFZ_PREVIEW_COMMAND='exa --tree --git --icons {}'

#   ---------------------------------------
#   3.  Misc.
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

if [ -n "$DESKTOP_SESSION" ]; then
    eval $(gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK
fi

[ -s "/home/andy/.jabba/jabba.sh" ] && source "/home/andy/.jabba/jabba.sh"

export N_PREFIX="$HOME/n"
[[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin" # Added by n-install (see http://git.io/n-install-repo).

#   ---------------------------------------
#   4.  ZSH Plugin Manager
#   ---------------------------------------

if [[ ! -f ~/.zpm/zpm.zsh ]]; then
    git clone --recursive https://github.com/zpm-zsh/zpm ~/.zpm
fi
source ~/.zpm/zpm.zsh

zpm load andrewferrier/fzf-z,autload:/executables

# Rocket Man
eval "$(starship init zsh)"

# Direnv for Directory Env variable management
eval "$(direnv hook zsh)"

# kubectl autocomplete
if [ /usr/bin/kubectl ]; then source <(kubectl completion zsh); fi

# Poetry and Pyenv
export PATH="$HOME/.poetry/bin:$PATH"

if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi
