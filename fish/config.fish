#!/usr/bin/env fish

# set fish_trace 1 # uncomment to debug shell.

if status --is-interactive
    for config in $__fish_config_dir/user/**/*.fish # User settings
        source $config
    end
end

set -x N_PREFIX "$HOME/.n"
fish_add_path -m $N_PREFIX/bin

# Misc.
[ -s "$HOME/.jabba/jabba.fish" ]; and source "$HOME/.jabba/jabba.fish"

# asdf
source ~/.asdf/asdf.fish

# Disable greeting
set fish_greeting
# to the Moon!
starship init fish | source
