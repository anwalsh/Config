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
export NVM_DIR=$HOME/.nvm

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  --no-use # This loads nvm

# Sourcing the powerline9k theme as I am too lazy to manually update the git repo
# at some interval of time.
ZSH_THEME="powerlevel10k/powerlevel10k"


POWERLEVEL9K_MODE="nerdfont-complete"
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_CONTEXT_TEMPLATE="%n@%m"
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='white'
POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='000' # 242
POWERLEVEL9K_ALWAYS_SHOW_CONTEXT="true"
POWERLEVEL9K_ALWAYS_SHOW_USER="true"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='9'
POWERLEVEL9K_DIR_HOME_FOREGROUND="black"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="black"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="black"
POWERLEVEL9K_ROOT_ICON="\uF09C"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(root_indicator context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status history time)

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

setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt prompt_subst              # enable parameter expansion, command substitution, and arithmetic expansion in the prompt
setopt transient_rprompt         # only show the rprompt on the current prompt
autoload colors; colors

zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'

# Plugins for ZSH
plugins=(git zsh-completions python npm pip vagrant history zsh-syntax-highlighting)
# Source ZSH
source $ZSH/oh-my-zsh.sh

# Source other files
source ~/.zsh/.secret_zsh
source ~/Config/zsh/.functions_zsh
source ~/Config/zsh/.aliases_zsh

#   ---------------------------------------
#   2.  FZF Config.
#   ---------------------------------------

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND='fdfind --type file --follow --hidden --exclude .git'
# export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden --follow -g ""'
export FZF_COMPLETION_TRIGGER='**'
export FZF_DEFAULT_OPTS="
    --height 40% --layout=reverse --border
    --preview '(highlight -O ansi -l {} 2> /dev/null || bat --style=numbers --color=always {} || tree -C {}) 2> /dev/null | head -200'
    --color fg:242,bg:236,hl:65,fg+:15,bg+:239,hl+:108
    --color info:108,prompt:109,spinner:108,pointer:168,marker:168
    --bind tab:down --cycle
"
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null ||  bat --style=numbers --color=always {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"

#   ---------------------------------------
#   3.  Misc.
#   ---------------------------------------

# Hub Wrapper Init
eval "$(hub alias -s)"

# Autojump sourcing lines
[ -f /usr/share/autojump/autojump.zsh ] && . /usr/share/autojump/autojump.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

[ -s "/home/andy/.jabba/jabba.sh" ] && source "/home/andy/.jabba/jabba.sh"

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).
