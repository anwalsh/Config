set shell=/bin/zsh

" If plug.vim is not present, create and install.
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif

let mapleader = "\<Space>"

set nocompatible
filetype plugin indent on
" Install Plugins {{{
call plug#begin('~/.vim/plugged')
Plug 'rakr/vim-one'
Plug 'chriskempson/base16-vim'
Plug 'edersonferreira/dalton-vim'
Plug 'reedes/vim-lexical'
Plug 'reedes/vim-pencil'
Plug 'ciaranm/securemodelines'
Plug 'justinmk/vim-sneak'
Plug 'junegunn/vim-easy-align'
Plug 'ryanoasis/vim-devicons'
Plug 'godlygeek/tabular'
Plug 'yggdroot/indentLine'
Plug 'luochen1990/rainbow'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-scriptease'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'wellle/targets.vim'
Plug 'tpope/vim-endwise'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-slash'
Plug 'tpope/vim-commentary'
Plug 'mbbill/undotree'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-vinegar'
Plug 'reedes/vim-wordy'
Plug 'machakann/vim-sandwich'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'machakann/vim-highlightedyank'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Shougo/echodoc.vim'
Plug 'cespare/vim-toml'
Plug 'rust-lang/rust.vim'
Plug 'arzg/vim-rust-syntax-ext'
Plug 'w0rp/ale'
Plug 'rhysd/vim-clang-format'
Plug 'lyuts/vim-rtags'
Plug 'majutsushi/tagbar'
Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'}
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'google/vim-codefmt'
Plug 'pangloss/vim-javascript'
Plug 'rhysd/vim-gfm-syntax'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tommcdo/vim-fugitive-blame-ext'
Plug 'rhysd/conflict-marker.vim'
Plug 'gregsexton/gitv'
Plug 'rbong/vim-flog'
Plug 'aymericbeaumet/vim-symlink'
Plug 'google/maktaba'
Plug 'tpope/vim-dispatch'
Plug 'mattn/webapi-vim'
Plug 'tpope/vim-obsession'
Plug 'dhruvasagar/vim-prosession'
Plug 'MTDL9/vim-log-highlighting'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'christoomey/vim-tmux-navigator'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'rhysd/clever-f.vim'
Plug 'justinmk/vim-gtfo'
Plug 'iamcco/markdown-preview.nvim', {'do': 'cd app && yarn install'}
Plug 'SidOfc/mkdx'
Plug 'elzr/vim-json'
Plug 'qpkorr/vim-bufkill'
Plug 'Asheq/close-buffers.vim'
Plug 'dhruvasagar/vim-zoom'
call plug#end()
" }}}

" Vim Setup {{{
syntax on

if (has("nvim"))
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
    set termguicolors
endif

hi Normal ctermbg=NONE
colorscheme base16-default-dark
" colorscheme dalton
" colorscheme one
set background=dark
set completeopt=noinsert,menuone,noselect
set vb t_vb= " No more beeps
set foldmethod=marker " Only fold on marks
set ruler " Where am I?
set ttyfast
" https://github.com/vim/vim/issues/1735#issuecomment-383353563
set lazyredraw
set synmaxcol=500
set laststatus=2
set noshowmode
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
set wildmenu
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
set showmatch
set hidden "allow hidden buffers. VERY GOOD. see help
set nobackup "dont make those filename~ files (they have bitten me many times)
set noswapfile "more trouble than they're worth
set undofile "keep persistent undo across vim runs
set undodir=~/.vim-undo/ "where to store undo files
set viminfo='20,<50,s1,h,f0 "limit the viminfo size to speed startup.
set nojoinspaces " only add one space after punctuation when joining lines.

function! CocCurrentFunction()
	return get(b:, 'coc_current_function', '')
endfunction

" Plugin settings
let g:secure_modelines_allowed_items = [
                \ "textwidth",   "tw",
                \ "softtabstop", "sts",
                \ "tabstop",     "ts",
                \ "shiftwidth",  "sw",
                \ "expandtab",   "et",   "noexpandtab", "noet",
                \ "filetype",    "ft",
                \ "foldmethod",  "fdm",
                \ "readonly",    "ro",   "noreadonly", "noro",
                \ "rightleft",   "rl",   "norightleft", "norl",
                \ "colorcolumn"
                \ ]

" from http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
if executable('rg')
	set grepprg=rg\ --no-heading\ --vimgrep
	set grepformat=%f:%l:%c:%m
endif
if executable('ag')
	set grepprg=ag\ --nogroup\ --nocolor
endif
" Show hidden characters
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

if !has('gui_running')
"change cursor icon based on mode
	let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
	let &t_SI = "\<Esc>[6 q" "insert - pipe
	let &t_SR = "\<Esc>[4 q" "replace - underbar
	let &t_EI = "\<Esc>[2 q" "normal - block
endif
" }}}

" Keybinds and Functions {{{
nnoremap <leader>fed :e ~/.vimrc<CR>
" Search results centered please
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
noremap <plug>(slash-after) zz
" Line hopping
nnoremap <silent> k :<C-U>execute 'normal!' (v:count > 1 ? "m'" . v:count : '') . 'k'<CR>
nnoremap <silent> j :<C-U>execute 'normal!' (v:count > 1 ? "m'" . v:count : '') . 'j'<CR>
" New empty buffer
noremap <leader>ns :enew<CR>
" Source new config
noremap <leader>feR :source ~/Config/nvim/.vimrc<CR>:PlugUpdate<CR>
" Buffer nav
noremap <leader>bl :ls<CR>
noremap <leader>bn :bn<CR>
noremap <leader>bp :bp<CR>
nnoremap <silent> <C-q> :Bdelete menu<CR>
nnoremap <silent> <leader>Q :Bdelete this<CR>
nnoremap <silent> <leader>bdo :Bdelete other<CR>
nnoremap <silent> <leader>bdd :BD<CR>
nnoremap <silent> <leader>bdh :Bdelete hidden<CR>
nnoremap <silent> <leader>bdw :bufdo BD<CR>
nnoremap <silent> <leader>bda :Bdelete all<CR>
" Delete hidden buffers
function! DeleteHiddenBuffers()
    let l:tpbl=[]
    let l:closed = 0
    call map(range(1, tabpagenr('$')), 'extend(l:tpbl, tabpagebuflist(v:val))')
    for l:buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(l:tpbl, v:val)==-1' )
        if getbufvar(l:buf, '&mod') == 0
            silent execute 'bwipeout' l:buf
            let l:closed += 1
        endif
    endfor
    echo 'Closed '.l:closed.' hidden buffers'
endfunction
nnoremap <leader>bD :call DeleteHiddenBuffers()<CR>
" Clean search (highlight)
nnoremap <silent><esc><esc> :noh<CR><esc>
" Coc Explorer config just in case
nnoremap <leader>n :CocCommand explorer<CR>
" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
noremap <leader>q :q<CR>
" Neat X clipboard integration
" p will paste clipboard into buffer
" c will copy entire buffer into clipboard
noremap <leader>p :read !xsel --clipboard --output<cr>
noremap <leader>c :w !xsel -ib<cr><cr>
" Adding some short cuts for more efficient workflows
" Move by line
nnoremap j gj
nnoremap k gk
inoremap jj <Esc>
" <leader><leader> toggles between buffers
nnoremap <leader><leader> <C-^>
" Open new file adjacent to current file
nnoremap <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
" Quick write
nmap <leader>w :w<CR>
" Keep splits but close buffer
nmap ,d :b#<bar>bd#<CR>
" Open hotkeys
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fp :Files<CR>
nnoremap <leader>f~ :Files ~/<CR>
nnoremap <leader>f/ :Files /<CR>
nnoremap <leader>fl :Lines<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>* :execute "Rgg! \\b".expand("<cword>")."\\b"<CR>
nnoremap <leader>fa :Rgg<CR>
nnoremap <leader>fA :Rgg!<CR>
nnoremap <leader>fd :Rggg<CR>
nnoremap <leader>fD :Rggg!<CR>
nnoremap <leader>fT :Tags<CR>
nnoremap <leader>ft :call fzf#vim#tags(expand('<cword>')." ", {'options': '--exact --select-1 --exit-0'})<CR>
" nnoremap <leader>fs :Snippets<CR>
" Make splits less terribad
nnoremap <leader>o :only<CR>
nnoremap <leader>/ :vsp<CR>
nnoremap <leader>- :sp<CR>
noremap <silent> <C-S-Left> :vertical resize +1<CR>
noremap <silent> <C-S-Right> :vertical resize -1<CR>
noremap <silent> <C-S-Up> :resize +1<CR>
noremap <silent> <C-S-Down> :resize -1<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" undotree functionality
nnoremap <leader>ut :UndotreeToggle<CR>
" tagbar functionality
nmap <leader>tb :TagbarToggle<CR>
" <leader>, shows/hides hidden characters
nnoremap <leader>, :set invlist<CR>
" Tabs
nnoremap <C-Left> :bprevious<CR>
nnoremap <C-Right> :bnext<CR>
nnoremap <tab> gt
nnoremap <S-tab> gT
nnoremap <silent> <leader>tn :tabnew<CR>
" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <c-c> <ESC>
nmap <silent> E <Plug>(coc-diagnostic-prev)
nmap <silent> W <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction
" Remap for rename current word
nmap <leader>cr <Plug>(coc-rename)
" Remap for format selected region
vmap <leader>cf  <Plug>(coc-format-selected)
nmap <leader>cf  <Plug>(coc-format-selected)
" Remap for do codeAction of current line
nmap <leader>cac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>cq  <Plug>(coc-fix-current)
" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')
" Show commands
nnoremap <silent> <leader>hc  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <leader>oo  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <leader>ls  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <leader>cj  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <leader>ck  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <leader>cp  :<C-u>CocListResume<CR>
" Open Quick fix list
nnoremap <leader>el :llist<CR>
" Fugitive
nnoremap <leader>ga :Git add %:p<CR><CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit -v -q<CR>
nnoremap <leader>gt :Gcommit -v -q %:p<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gw :Gwrite<CR><CR>
nnoremap <leader>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <leader>gp :Ggrep<Space>
nnoremap <leader>gm :Gmove<Space>
nnoremap <leader>gb :Git branch<Space>
nnoremap <leader>go :Git checkout<Space>
nnoremap <leader>gps :Git push<CR>
nnoremap <leader>gpl :Git pull<CR>
vnoremap > >gv
vnoremap < <gv
" navigate Ale errors
nmap <silent> <C-]> <Plug>(ale_previous_wrap)
nmap <silent> <C-[> <Plug>(ale_next_wrap)
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ea <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ea <Plug>(EasyAlign)
nnoremap <leader>' :call TermToggle(12)<CR>
" inoremap <leader><Esc>:call TermToggle(12)<CR>
tnoremap <leader><C-\><C-n>:call TermToggle(12)<CR>
tnoremap :q! <C-\><C-n>:q!<CR>
" Terminal Function
tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"

let g:term_buf = 0
let g:term_win = 0
function! TermToggle(height)
    if win_gotoid(g:term_win)
        hide
    else
        botright new
        exec "resize " . a:height
        try
            exec "buffer " . g:term_buf
        catch
            call termopen($SHELL, {"detach": 0})
            let g:term_buf = bufnr("")
            set nonumber
            set norelativenumber
            set signcolumn=no
        endtry
        startinsert!
        let g:term_win = win_getid()
    endif
endfunction

" {{{ Highlighted Yank
let g:highlightedyank_highlight_duration = 400

" mapping
if !exists('##TextYankPost')
  map y <Plug>(highlightedyank)
endif

" Highlights the text that you yanked.
" Only works on neovim 0.5.0+ (remove vim-highlightedyank once that is the stable version)
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank("IncSearch", 1000)
augroup END
" }}}

" }}}

" Plugin Config {{{

" Buffer Kill Configuration {{{
let g:BufKillCreateMappings = 0
" }}}

let base16colorspace = 256

" Airline {{{
	let g:airline_powerline_fonts = 1
	let g:airline#extensions#tabline#enabled = 1
	let g:airline#extensions#branch#enabled = 1
    let g:airline_left_sep = ""
    let g:airline_right_sep = ""
	" let g:airline_theme = "onedark"
	let g:airline_theme = "base16_vim"
    " let g:airline_theme = "dalton"
	let g:airline_section_warning = ""
	let g:airline_stl_path_style = 'short'
	let g:airline_section_y = ''
	let g:airline_section_x = ''
    let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
" }}}
" Vim Rooter
let g:rooter_patterns = ['.git', '.git/']

" Turn on rainbow brackets/parens
let g:rainbow_active = 1

" Clever-f config
let g:clever_f_smart_case = 1
let g:clever_f_chars_match_any_signs = ';'

" colorizer
lua require'colorizer'.setup()
let g:colorizer_auto_filetype='css,html,javascript'

autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')

let g:coc_global_extensions = ['coc-css', 'coc-dictionary', 'coc-prettier', 'coc-eslint',
                \ 'coc-word', 'coc-go', 'coc-xml', 'coc-java', 'coc-json', 'coc-rust-analyzer',
                \ 'coc-tsserver', 'coc-yaml', 'coc-python', 'coc-snippets', 'coc-marketplace',
				\ 'coc-vimlsp', 'coc-ccls', 'coc-explorer', 'coc-diagnostic']
let g:fzf_buffers_jump = 1
let g:fzf_layout = { 'down': '~20%' }

if executable('rg')
    set grepprg=rg\ --vimgrep\ --color=never
endif

command! -bang -nargs=* Rgg
            \ call fzf#vim#grep(
            \   'rg --column --line-number --no-heading --color=never '.shellescape(<q-args>), 1,
            \   <bang>0 ? fzf#vim#with_preview('up:60%')
            \           : fzf#vim#with_preview('right:50%', '?'),
            \   <bang>0)

command! -bang -nargs=* Rggg
            \ call fzf#vim#grep(
            \   'rg --column --line-number --no-heading --color=never '.shellescape(<q-args>), 1,
            \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
            \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%', '?'),
            \   <bang>0)


" Likewise, Files command with preview window
command! -bang -nargs=? -complete=dir Files
            \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" Autocmds clearing the sign column and appropriately identifying/setting the format {{{
	augroup configgroup
		autocmd!
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
		autocmd Filetype cfg setlocal expandtab ts=4 sts=4 commentstring=#\ %s
	augroup END
" }}}

" Python {{{
autocmd filetype python setlocal textwidth=78
" Figure out the system Python for Neovim.
if exists("$VIRTUAL_ENV")
    let g:python3_host_prog=substitute(system("which -a python3 | head -n2 | tail -n1"), "\n", '', 'g')
else
    let g:python3_host_prog=substitute(system("which python"), "\n", '', 'g')
endif
" }}}

" config to make writing english in vim better
autocmd FileType markdown setlocal spell spelllang=en_us
autocmd FileType gitcommit setlocal spell spelllang=en_us

" Rust things {{{
" Rust Playground Copy to Clipboard
let g:rust_clip_command = 'xclip -selection clipboard'
" Rusty-tags configuration
autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/
autocmd BufWritePost *.rs :silent! exec "!rusty-tags vi --quiet --start-dir=" . expand('%:p:h') . "&" | redraw!
" }}}

" Golang Configuration {{{
	let g:go_fmt_fail_silently = 0
	let g:go_fmt_command = 'goimports'
	let g:go_autodetect_gopath = 1
	let g:go_term_enabled = 1
	let g:go_def_mapping_enabled = 0
	let g:go_highlight_array_whitespace_error = 1
	let g:go_highlight_extra_types = 1
	let g:go_highlight_chan_whitespace_error = 1
	let g:go_highlight_operators = 1
	let g:go_highlight_functions = 1
	let g:go_highlight_function_parameters = 1
	let g:go_highlight_types = 1
	let g:go_highlight_fields = 1
	let g:go_highlight_build_constraints = 1
	let g:go_highlight_generate_tags = 1
	let g:go_highlight_variable_declarations = 1
	let g:go_highlight_variable_assignments = 1
	let g:go_fmt_autosave = 1
" }}}

" Better file behavior {{{
" Jump to last edit position on opening file
if has("autocmd")
    " https://stackoverflow.com/questions/31449496/vim-ignore-specifc-file-in-autocommand
    au BufReadPost * if expand('%:p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
" reload files changed outside vim
set autoread
" Trigger `autoread` when files changes on disk
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" Notification after file change
autocmd FileChangedShellPost *
\ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" Disable syntax highlighting for large files
autocmd BufReadPre * if getfsize(expand("%")) > 1000000 | syntax off | endif

" ========= vim-better-whitespace ==================
" auto strip whitespace except for file with extention blacklisted
let blacklist = ['diff', 'gitcommit', 'unite', 'qf', 'help', 'markdown', 'text']
autocmd BufWritePre * if index(blacklist, &ft) < 0 | StripWhitespace
" }}}

" Ale Linting {{{
	let g:ale_completion_enabled = 0
	let g:ale_linters = { 'rust': ['rustfmt', 'rust-analyzer', 'clippy', 'cargo'],
						\ 'markdown': ['prettier'],
						\ 'python': ['flake8', 'pylint'],
						\ 'go': ['golangci-lint', 'gofmt', 'golint', 'goimports'],
						\ 'javascript': ['eslint', 'prettier']
						\ }
	let g:ale_fixers = { 'sh': ['shfmt'],
					   \ 'rust': ['rustfmt'],
					   \ 'markdown': ['prettier'],
					   \ 'python':   ['black'],
					   \ 'javascript': ['eslint'],
					   \ 'json': ['prettier'],
					   \ 'yaml': ['prettier'],
					   \ 'xml': ['xmllint']
					   \ }
	let g:ale_rust_cargo_use_clippy = 1
	let g:ale_fix_on_save = 1
	let g:ale_go_golangci_lint_options = '--fast'
	let g:ale_set_loclist = 1
	let g:ale_sign_error = '✘'
    let g:ale_sign_warning = ''
    let g:ale_sign_info = ''
" }}}

" Lexical Config {{{
augroup lexical
    autocmd!
    autocmd FileType markdown,mkd call lexical#init()
    autocmd FileType textile call lexical#init()
    autocmd FileType text,txt call lexical#init({ 'spell': 0 })
augroup END
" }}}

" Vim Pencil {{{
augroup pencil
    autocmd!
    autocmd FileType markdown,md call pencil#init()
    autocmd FileType text,txt call pencil#init()
augroup END
" }}}

" Vim Visual Multi Configuration {{{
let g:VM_leader = "\\"

" custom remaps (full list: https://github.com/mg979/vim-visual-multi/wiki/Mappings)
let g:VM_maps = {}
let g:VM_maps["Undo"] = 'u'
let g:VM_maps["Redo"] = '<C-r>'
let g:VM_maps["Add Cursor Down"] = '<C-j>'
let g:VM_maps["Add Cursor Up"]   = '<C-k>'
" }}}

" {{{ Markdown Preview
autocmd FileType markdown nmap <buffer> <leader>mv <Plug>MarkdownPreview
autocmd FileType markdown let m = {
    \ 'name': '+markdown',
    \ 'v': 'Markdown preview start',
    \ }
" }}}

" IndentLines Config {{{
let g:indentLine_fileTypeExclude = ['tex', 'txt', 'markdown']
autocmd FileType help,coc-explorer IndentLinesToggle
" }}}

" Vim JSON {{{
let g:vim_json_syntax_conceal = 0
let g:vim_json_warnings = 0

au! BufRead,BufNewFile *.json set filetype=json

augroup json_autocmd
	autocmd!
	autocmd FileType json set foldmethod=syntax
	autocmd FileType json set foldlevelstart=99
augroup END
" }}}

autocmd BufNewFile,BufRead Dockerfile.release setlocal filetype=dockerfile
autocmd BufNewFile,BufRead Dockerfile.dev* setlocal filetype=dockerfile

let g:sneak#label = 1

" End of plugin config
" }}}

if has('nvim')
	runtime! plugin/python_setup.vim
endif

