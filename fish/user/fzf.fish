set -l background "#0b0d0f"
set -l current_line "#131a20"
set -l selection "#131a20"
set -l foreground "#f8f8f2"
set -l comment "#6272a4"
set -l cyan "#8be9fd"
set -l green "#50fa7b"
set -l orange "#ffb86c"
set -l pink "#ff79c6"
set -l purple "#bd93f9"
set -l red "#ff5555"
set -l yellow "#f1fa8c"

# FZF Default Settings
set -gx FZF_DEFAULT_COMMAND 'fd --type f --hidden --follow --exclude .git'
set -gx FZF_DEFAULT_OPTS "\
    --height 60%
    --reverse
    --color=dark
    --color fg:-1,bg:$background,hl:$green,fg+:$foreground,bg+:$current_line,hl+:$pink
    --color info:$comment,prompt:$green,spinner:$green,pointer:$cyan,marker:$pink,header:$purple
    --bind=tab:down,btab:up
    --bind='alt-k:preview-up,alt-p:preview-up'
    --bind='alt-j:preview-down,alt-n:preview-down'
    --bind='ctrl-r:toggle-all'
    --bind='ctrl-s:toggle-sort'
    --bind='?:toggle-preview'
    --bind='alt-w:toggle-preview-wrap'
    --cycle
    --preview-window='right:60%'
    --ansi
    "

# `forgit` settings
set -x FORGIT_FZF_DEFAULT_OPTS "
    --ansi
    --height 60%
    --bind=tab:down,btab:up
    --bind='alt-k:preview-up,alt-p:preview-up'
    --bind='alt-j:preview-down,alt-n:preview-down'
    --bind='ctrl-r:toggle-all'
    --bind='ctrl-s:toggle-sort'
    --bind='?:toggle-preview'
    --bind='alt-w:toggle-preview-wrap'
    --preview-window='right:60%'
    +1
"

# Zoxide FZF settings
set -gx _ZO_FZF_OPTS "\
    --height 60%
    --reverse
    --color=dark
    --color fg:-1,bg:$background,hl:$green,fg+:$foreground,bg+:$current_line,hl+:$pink
    --color info:$comment,prompt:$green,spinner:$green,pointer:$cyan,marker:$pink,header:$purple
    --bind=tab:down,btab:up
    --bind='alt-k:preview-up,alt-p:preview-up'
    --bind='alt-j:preview-down,alt-n:preview-down'
    --bind='ctrl-r:toggle-all'
    --bind='ctrl-s:toggle-sort'
    --bind='?:toggle-preview'
    --bind='alt-w:toggle-preview-wrap'
    --preview-window='right:60%'
    --cycle
    --ansi
    "
