# Global Environment Variables
# These get set before anything else in the interactive shell, from a user configuration perspective.

# M1-specific
set -l os (uname)
if test "$os" = Darwin
    eval (/opt/homebrew/bin/brew shellenv)
end

# HOME
set -gx GITLOCAL_HOME $HOME/GitLocal
set -gx DOTFILES_HOME $HOME/Config
set -gx FISH_HOME $DOTFILES_HOME/fish
set -gx WORK_HOME $GITLOCAL_HOME/github.com/10gen
set -gx MMS_HOME $WORK_HOME/mms

# Applications
set -gx EDITOR nvim
set -gx BAT_THEME Dracula
set -gx CHEAT_COLORS true
set -gx CHEAT_COLORSCHEME dark
set -gx COLORTERM truecolor
set -gx MANPAGER "sh -c 'col -bx | bat -l man -p --style=numbers,grid'"
set -gx TERM xterm-256color
set -gx HOMEBREW_NO_AUTO_UPDATE 1
set -gx VASA_HOME $HOME/.vasa
set -gx KUBECONFIG $HOME/.kube/config
set -gx KREW_ROOT $HOME/.krew
set -gx M_PREFIX $HOME
set -gx JABBA $HOME/.jabba/bin
set -gx export ANT_HOME $HOME/apache-ant-1.10.5
set -gx export JAVA_HOME $HOME/.jabba/jdk/default/Contents/Home/

# Fisher
set -gx fisher_path $FISH_HOME

# Go
set -gx GOPATH $HOME/go

# Rust
set -gx RUST_ENV $HOME/.cargo/env

# Node/JS
set -gx NODEMODS $HOME/node_modules/.bin

# Python
set -gx PYENV_ROOT $HOME/.pyenv

# Pathing
fish_add_path -a $PYENV_ROOT/bin
fish_add_path -a $HOME_LOCAL_BIN
fish_add_path -a $GOPATH/bin
fish_add_path -a $KREW_ROOT/bin
fish_add_path -a /opt/homebrew/bin/go
fish_add_path -a $HOME/.cargo/bin
fish_add_path -a $HOME/.poetry/bin
fish_add_path -a $PYENV_ROOT/bin
fish_add_path -a $HOME/.emacs.d/bin
fish_add_path -a $WORK_HOME/ops-tools/scripts/python/sshnds/bin
fish_add_path -a /usr/bin
fish_add_path -a /usr/sbin
fish_add_path -a /sbin
fish_add_path -a /usr/local/bin
fish_add_path -a /usr/local/sbin
fish_add_path -a $HOME/bin
fish_add_path -a $HOME/.local/bin
fish_add_path -a /opt/homebrew/bin
