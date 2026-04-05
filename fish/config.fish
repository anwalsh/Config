#!/usr/bin/env fish

# set fish_trace 1 # uncomment to debug shell.
fzf --fish | source

if status --is-interactive
    for config in $__fish_config_dir/user/**/*.fish # User settings
        source $config
    end
end

source $__fish_config_dir/themes/carbonfox.fish

set -x N_PREFIX "$HOME/.n"
fish_add_path -m $N_PREFIX/bin

# ASDF configuration code
if test -z $ASDF_DATA_DIR
    set _asdf_shims "$HOME/.asdf/shims"
else
    set _asdf_shims "$ASDF_DATA_DIR/shims"
end

# Disable greeting
set fish_greeting
# to the Moon!
starship init fish | source

direnv hook fish | source
pyenv init - fish | source

# source env
envsource ~/.env
