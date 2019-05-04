set shell=/bin/zsh
" If plug.vim is not present, create and install.
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | scurce ~/.config/nvim/init.vim
endif

let mapleader = "\<Space>"

set nocompatible
filetype plugin indent on

function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py --clang-completer
  endif
endfunction
" =============================================================================
" # PLUGINS
" =============================================================================
call plug#begin('~/.vim/plugged')
" Load plugins
" Color Scheme
Plug 'rakr/vim-one'
" VIM enhancements
Plug 'ciaranm/securemodelines'
Plug 'vim-scripts/localvimrc'
Plug 'justinmk/vim-sneak'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'godlygeek/tabular'
Plug 'yggdroot/indentLine'
Plug 'kien/rainbow_parentheses.vim'
Plug 'ntpeters/vim-better-whitespace'
" Vimscript enhancements
Plug 'tpope/vim-repeat' " makes . and u work better with plugins
Plug 'tpope/vim-scriptease' " helpers when writing vimscript
" Vim editing enhancements
Plug 'easymotion/vim-easymotion' " Jump anywhere you can see super fast
Plug 'tpope/vim-surround' " commands for adding or changing surroundings
Plug 'wellle/targets.vim' " More text objects (daa to delete an argument)
Plug 'tpope/vim-commentary'
Plug 'terryma/vim-multiple-cursors'
Plug 'AndrewRadev/dsf.vim' " dsf -> Delete Surrounding Function call
Plug 'tweekmonster/braceless.vim' " text objects for indentation-based languages
Plug 'tpope/vim-endwise' " End block in languages that use words for blocks
Plug 'tpope/vim-commentary' " comment things out
Plug 'mbbill/undotree' " visualize the undo tree (:h undo-tree)
Plug 'mjbrownie/swapit' " <c-a>/<c-x> to toggle more things (like true/false)
Plug 'tpope/vim-eunuch' " Support for Unix commands like :Mkdir from within Vim
Plug 'tpope/vim-vinegar' " Support for file finding
" GUI enhancements
Plug 'itchyny/lightline.vim'
Plug 'w0rp/ale'
Plug 'machakann/vim-highlightedyank'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'jiangmiao/auto-pairs'
" Language Server Support
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
" Let the LSP flow through you . . .
let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'python': ['pyls'],
    \ }
let g:LanguageClient_autoStart = 1
nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
" Fuzzy finder
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'roxma/vim-hug-neovim-rpc'
" Completion plugins
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
" enable ncm2 for all buffers
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-tmux'
Plug 'ncm2/ncm2-path'
" LanguageClient enhancements
" Showing function signature and inline doc.
Plug 'Shougo/echodoc.vim'
" Syntactic language support
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/syntastic'
Plug 'cespare/vim-toml'
Plug 'rust-lang/rust.vim'
" C++/C
Plug 'rhysd/vim-clang-format'
Plug 'lyuts/vim-rtags'
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
Plug 'majutsushi/tagbar'
Plug 'vim-scripts/a.vim'
" go
Plug 'fatih/vim-go', {'do': ':GoInstallBinaries'}
Plug 'zchee/deoplete-go', { 'do': 'make' }
" python
Plug 'davidhalter/jedi-vim'
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'} " highlighting for requirements.txt
Plug 'Vimjas/vim-python-pep8-indent' " better python indentation
" GitGutter
Plug 'airblade/vim-gitgutter'
" Code Formatting
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
" JS stuff
Plug 'marijnh/tern_for_vim', {'do': 'npm install'} " JS autocomplete
Plug 'pangloss/vim-javascript' " Better js indent and syntax
" JSON/XML/MD stuff
Plug 'rhysd/vim-gfm-syntax' " highlight github-flavored markdown
Plug 'elzr/vim-json' " Better json syntax + concealing noise
Plug 'sukima/xmledit' " XML and HTML helpers
" Git stuff
Plug 'airblade/vim-gitgutter' " show changed lines in gutter
Plug 'tpope/vim-fugitive' " Git integration
Plug 'tpope/vim-rhubarb' " Github support for fugitive
Plug 'tommcdo/vim-fugitive-blame-ext' " Show commit summary for line in :Gblame
Plug 'jreybert/vimagit' " :Magit to see overview of current changes
Plug 'rhysd/conflict-marker.vim' " Add [x and ]x to hop between conflicts
Plug 'gregsexton/gitv' " like git log in vim
" WebAPI for Rust Playpen
Plug 'mattn/webapi-vim'
" End Plug Call
call plug#end()
" =============================================================================
" # GUI/Basic Options
" =============================================================================
syntax on
" Better Colors
if (match($TERM, "-256color") != -1) && (match($TERM, "screen-256color") == -1)
  " screen does not (yet) support truecolor
  set termguicolors
endif

" Make autocomplete less stupid
set completeopt=noinsert,menuone,noselect
set vb t_vb= " No more beeps
set foldmethod=marker " Only fold on marks
set ruler " Where am I?
set ttyfast
" https://github.com/vim/vim/issues/1735#issuecomment-383353563
set lazyredraw
set synmaxcol=500
set laststatus=2
set number
set textwidth=100
set relativenumber " Relative line numbers
" Make diffing better: https://vimways.org/2018/the-power-of-diff/
set diffopt+=algorithm:patience
set diffopt+=indent-heuristic
set diffopt+=vertical
set diffopt+=iwhite " No whitespace in vimdiff
set colorcolumn=100 " and give me a colored column
set showcmd " Show (partial) command in status line.
set mouse=a " Enable mouse usage (all modes) in terminals
set confirm " ask for confirmation when closing unsaved buffers
set shortmess+=c " don't give |ins-completion-menu| messages.
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary
" Sane splits
set splitright
set splitbelow
" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
" Tabstops
" Fix backspace indent
set backspace=indent,eol,start
set backspace=2 " Backspace over newlines
" Tabs. May be overriten by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab
set autoindent "enable the following line
set smartindent "do the Right Thing
let g:indentLine_char = "\u2502"
" Colors
set background=dark
colorscheme one
hi Normal ctermbg=NONE
hi Visual cterm=NONE ctermbg=DarkGray ctermfg=NONE
" Line hopping
" Ref: https://superuser.com/questions/539708/vim-moving-around-using-relativenumber-and-adding-it-to-the-jump-list-for-use-w
nnoremap <silent> k :<C-U>execute 'normal!' (v:count > 1 ? "m'" . v:count : '') . 'k'<CR>
nnoremap <silent> j :<C-U>execute 'normal!' (v:count > 1 ? "m'" . v:count : '') . 'j'<CR>
" Vim Autocomplete Menu
set wildmenu
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
set showmatch
set hidden "allow hidden buffers. VERY GOOD. see help
set nobackup "dont make those filename~ files (they have bitten me many times)
set noswapfile "more trouble than they're worth
set spell "enable spell checking use ":set nospell" to turn it off for a single buffer
set spelllang=en_us "use US dictionary for spelling
set undofile "keep persistent undo across vim runs
set undodir=~/.vim-undo/ "where to store undo files
set splitright " Make :vsplit put new window to the right, where it belongs
set viminfo='20,<50,s1,h,f0 "limit the viminfo size to speed startup.
set nojoinspaces " only add one space after punctuation when joining lines.
autocmd BufEnter * call ncm2#enable_for_buffer()
" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
	command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
				\ | wincmd p | diffthis
endif

" Lightline
let g:lightline = { 'colorscheme': 'wombat' }
let g:lightline = {
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \ },
\ }
function! LightlineFilename()
  return expand('%:t') !=# '' ? @% : '[No Name]'
endfunction

" from http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
if executable('ag')
	set grepprg=ag\ --nogroup\ --nocolor
endif
if executable('rg')
	set grepprg=rg\ --no-heading\ --vimgrep
	set grepformat=%f:%l:%c:%m
endif

" Search results centered please
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" Show those damn hidden characters
" Verbose: set listchars=nbsp:¬,eol:¶,extends:»,precedes:«,trail:•
:set nolist
:set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,precedes:«,extends:»

" Always show sign column for GitGutter
if exists('&signcolumn')  " Vim 7.4.2201
  set signcolumn=yes
else
  let g:gitgutter_sign_column_always = 1
endif

" Copy/Paste/Cut
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

" macOS Copy and Paste
if has('macunix')
  " pbcopy for OSX copy/paste
  vmap <C-x> :!pbcopy<CR>
  vmap <C-c> :w !pbcopy<CR><CR>
endif

" Buffer nav
noremap <leader>z :bp<CR>
noremap <leader>q :bp<CR>
noremap <leader>x :bn<CR>
noremap <leader>w :bn<CR>

" Close buffer
noremap <leader>c :bd<CR>

" Clean search (highlight)
nnoremap <silent> <leader>n :noh<CR>

" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

" Neat X clipboard integration
" ,p will paste clipboard into buffer
" ,c will copy entire buffer into clipboard
noremap <leader>p :read !xsel --clipboard --output<cr>
noremap <leader>c :w !xsel -ib<cr><cr>

" <leader>s for Rg search
noremap <leader>s :Rg
let g:fzf_layout = { 'down': '~20%' }
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" command! -bang -nargs=? -complete=dir Files
"   \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

function! s:list_cmd()
  let base = fnamemodify(expand('%'), ':h:.:S')
  return base == '.' ? 'fd --type file --follow --hidden' : printf('fd --type file --follow | proximity-sort %s', expand('%'))
endfunction

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, {'source': s:list_cmd(),
  \ 'options': '--tiebreak=index'}, <bang>0)

" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

" jk is escape
inoremap jk <esc>

" Autocmds clearing the sign column and appropriately identifying/setting the format
augroup configgroup
    autocmd!
BufNewFile,BufRead,
    autocmd VimEnter * highlight clear SignColumn
    autocmd FileType python setlocal commentstring=#\ %s
    autocmd FileType fstab,systemd setlocal noexpandtab
    autocmd FileType gitconfig,sh,toml setlocal noexpandtab
    autocmd Filetype rust setlocal sw=4 sts=4 ts=4 expandtab
    autocmd Filetype cls setlocal filetype=java
    autocmd Filetype Makefile setlocal noexpandtab
    autocmd Filetype sh setlocal ts=2 sw=2 sts=2
    autocmd Filetype java setlocal ts=2 sw=2 sts=2
    autocmd Filetype vim setlocal noet ts=4 sw=4 sts=4
    autocmd Filetype text setlocal noet ts=4 sw=4
    autocmd Filetype md setlocal spell expandtab ts=4 sw=4 sts=4
    autocmd Filetype yml,yaml setlocal expandtab ts=2 sw=2
    autocmd Filetype c,cpp setlocal expandtab ts=4 sw=4
    autocmd Filetype hpp setlocal expandtab ts=4 sw=4
    autocmd Filetype json setlocal expandtab ts=2 sw=2
    autocmd Filetype go setlocal noexpandtab ts=4 sw=4 sts=4
augroup END

" Autoformat
augroup autoformat_settings
  autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType rust  AutoFormatBuffer rustfmt
  autocmd FileType html,css,json AutoFormatBuffer js-beautify
  autocmd FileType python AutoFormatBuffer autopep8
augroup END

" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
set shortmess+=c

" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <c-c> <ESC>

" racer + rust
" https://github.com/rust-lang/rust.vim/issues/192
let g:rustfmt_command = "rustfmt"
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0
let $RUST_SRC_PATH = systemlist("rustc --print sysroot")[0] . "/lib/rustlib/src/rust/src"
" Rust Playground Copy to Clipboard
let g:rust_clip_command = 'xclip -selection clipboard'
" Linter
let g:ale_sign_column_always = 1
" only lint on save
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_save = 0
let g:ale_lint_on_enter = 0
let g:ale_rust_cargo_use_check = 1
let g:ale_rust_cargo_check_all_targets = 1
let g:ale_rust_rls_config = {
	\ 'rust': {
		\ 'all_targets': 1,
		\ 'build_on_save': 1,
		\ 'clippy_preference': 'on'
	\ }
	\ }
let g:ale_rust_rls_toolchain = ''
let g:ale_linters = {'rust': ['rls']}
highlight link ALEWarningSign Todo
highlight link ALEErrorSign WarningMsg
highlight link ALEVirtualTextWarning Todo
highlight link ALEVirtualTextInfo Todo
highlight link ALEVirtualTextError WarningMsg
highlight ALEError guibg=None
highlight ALEWarning guibg=None
let g:ale_sign_error = "✖"
let g:ale_sign_warning = "⚠"
let g:ale_sign_info = "i"
let g:ale_sign_hint = "➤"

nnoremap <silent> gd :ALEGoToDefinition<CR>

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#go#gocode_binary = $HOME.'/go/bin/gocode'

" Golang Configuration
let g:go_fmt_fail_silently = 0
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_term_enabled = 1
let g:go_highlight_space_tab_error = 0
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_extra_types = 0
let g:go_highlight_operators = 0
let g:go_highlight_build_constraints = 1
let g:go_fmt_autosave = 1

" Adding some short cuts for more efficient workflows
" Move by line
nnoremap j gj
nnoremap k gk
" Jump to next/previous error
nnoremap <C-j> :cnext<cr>
nnoremap <C-k> :cprev<cr>
nmap <silent> L <Plug>(ale_lint)
" nmap <silent> <C-k> <Plug>(ale_previous_wrap)
" nmap <silent> <C-j> <Plug>(ale_next_wrap)
nnoremap <C-l> :copen<cr>
nnoremap <C-g> :cclose<cr>
" <leader><leader> toggles between buffers
nnoremap <leader><leader> <c-^>
" Open new file adjacent to current file
nnoremap <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
" Quick write
nmap <leader>w :w<CR>
" Open hotkeys
map <C-p> :Files<CR>
nmap <leader>; :Buffers<CR>
" Make splits less terribad
nnoremap <Leader>o :only<CR>
nnoremap <Leader>/ :vsp<CR>
nnoremap <Leader>- :sp<CR>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" undotree functionality
nnoremap <F5> :UndotreeToggle<cr>
" tagbar functionality
nmap <F8> :TagbarToggle<CR>

" Jump to last edit position on opening file
if has("autocmd")
  " https://stackoverflow.com/questions/31449496/vim-ignore-specifc-file-in-autocommand
  au BufReadPost * if expand('%:p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" <leader>= reformats current tange
nnoremap <leader>f :'<,'>RustFmtRange<cr>
" <leader>, shows/hides hidden characters
nnoremap <leader>, :set invlist<cr>
" I can type :help on my own, thanks.
map <F1> <Esc>
imap <F1> <Esc>
" Rusty-tags configuration
autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/
autocmd BufWritePost *.rs :silent! exec "!rusty-tags vi --quiet --start-dir=" . expand('%:p:h') . "&" | redraw!

" ========= vim-better-whitespace ==================

" auto strip whitespace except for file with extention blacklisted
let blacklist = ['diff', 'gitcommit', 'unite', 'qf', 'help', 'markdown']
autocmd BufWritePre * if index(blacklist, &ft) < 0 | StripWhitespace

" Rainbow parens
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" YCM Config
let g:ycm_filetype_blacklist = {
      \ 'markdown': 1,
      \ 'rust': 1,
      \ 'go': 1,
      \ 'text': 1,
      \ 'vimwiki': 1,
      \ 'python': 1,
      \ 'java': 1,
      \ 'vim': 1,
      \}

" reload files changed outside vim
set autoread
" Trigger `autoread` when files changes on disk
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" Notification after file change
autocmd FileChangedShellPost *
\ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

if has('nvim')
	runtime! plugin/python_setup.vim
endif
