# Global Environment Variables
# These get set before anything else in the interactive shell, from a user configuration perspective.

# M1-specific
eval (/opt/homebrew/bin/brew shellenv)

# HOME
set -gx GITLOCAL_HOME $HOME/GitLocal
set -gx DOTFILES_HOME $HOME/Config
set -gx NVIM_HOME $DOTFILES_HOME/nvim
set -gx FISH_HOME $DOTFILES_HOME/fish

set -gx EDITOR nvim
set -gx BAT_THEME Dracula
set -gx CHEAT_COLORS true
set -gx CHEAT_COLORSCHEME dark
set -gx COLORTERM truecolor
set -gx MANPAGER "sh -c 'col -bx | bat -l man -p --style=numbers,grid'"
set -gx TERM xterm-256color

set -gx GOPATH $HOME/go
set -gx RUST $HOME/.cargo/bin
set -gx WORK_HOME $GITLOCAL_HOME/github.com/10gen
set -gx PYENV_ROOT $HOME/.pyenv
set -gx VASA_HOME $HOME/.vasa
set -gx KUBECONFIG $HOME/.kube/config

set -gx fisher_path $FISH_HOME

# Pathing
