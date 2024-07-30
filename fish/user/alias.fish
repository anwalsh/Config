alias brew="env PATH=(string replace (pyenv root)/shims '' \"\$PATH\") brew" # Ref: https://github.com/pyenv/pyenv#:~:text=root)%5C/shims%3A/%7D%22%20brew%27-,Fish,-%3A

# exa-related aliases
alias ls='eza -F --group-directories-first --icons --color-scale'
alias l='eza -lF --group-directories-first --icons --color-scale'
alias ll='eza -laF --group-directories-first --icons --color-scale --git --time-style long-iso'
alias tree='eza -F --group-directories-first --icons --color-scale --tree -L 2'
