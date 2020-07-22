" v0.1 2012-10-22 Philip Thrasher
" Basics script copied from https://gist.github.com/pthrasher/3933522
" For this to work, you must install the vundle plugin manually.
" https://github.com/gmarik/vundle
" To install vundle, copy all the files from the repo into your respective
" folders within ~/.vim
"
set nocompatible
filetype off

" Vundle let's you specify a plugin in a number of formats, but my favorite
" allows you to grab plugins straight off of github, just specify the bundle
" in the following format:
" Bundle 'githubUsername/repoName'

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

" leader is a key that allows you to have your own "namespace" of keybindings.
" You'll see it a lot below as <leader>
let mapleader = ","

" We have to turn this stuff back on if we want all of our features.
filetype plugin indent on " Filetype auto-detection
syntax on " Syntax highlighting

set pastetoggle=<F2> " Toogle to paste mode with F2
set backspace=2 "make backspace work like othe apps
set tabstop=2
set shiftwidth=2
set softtabstop=2
set updatetime=250 "Quickly mark updated files (250ms)
set expandtab " use spaces instead of tabs.
set smarttab " let's tab key insert 'tab stops', and bksp deletes tabs.
set shiftround " tab / shifting moves to closest tabstop.
set autoindent " Match indents on new lines.
set smartindent " Intellegently dedent / indent new lines based on rules.

" We have VCS -- we don't need this stuff.
set nobackup " We have vcs, we don't need backups.
set nowritebackup " We have vcs, we don't need backups.
set noswapfile " They're just annoying. Who likes them?

" don't nag me when hiding buffers
set hidden " allow me to have buffers with unsaved changes.
set autoread " when a file has changed on disk, just load it. Don't ask.

" Make search more sane
set ignorecase " case insensitive search
set smartcase " If there are uppercase letters, become case-sensitive.
set incsearch " live incremental searching
set showmatch " live match highlighting
set hlsearch " highlight matches
set gdefault " use the `g` flag by default.
set number " Show line numbers

syntax enable

" allow the cursor to go anywhere in visual block mode.
set virtualedit+=block

" So we don't have to press shift when we want to get into command mode.
nnoremap ; :
vnoremap ; :

" So we don't have to reach for escape to leave insert mode.
inoremap jf <esc>

" create new vsplit, and switch to it.
noremap <leader>v <C-w>v

" create new hsplit, and switch to it.
noremap <leader>h <esc>:sp<CR>

" more natural split opening
set splitbelow
set splitright

" bindings for easy split nav
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"easiser moving between tabs
map <Leader>f <esc>:tabn<CR>
map <Leader>a <esc>:tabp<CR>

" easily toogle code folds
nnoremap f za

"easier moving of code block using < and > keys for better code indentation
vnoremap < <gv
vnoremap > >gv

" Use sane regex's when searching
nnoremap / /\v
vnoremap / /\v

" Clear match highlighting
noremap <leader><space> :noh<cr>:call clearmatches()<cr>

" Quick buffer switching - like cmd-tab'ing
nnoremap <leader><leader> <c-^>

" Visual line nav, not real line nav
" If you wrap lines, vim by default won't let you move down one line to the
" wrapped portion. This fixes that.
noremap j gj
noremap k gk


" =============================== Plugins ==============================

" Let vundle manage itself:
Plugin 'gmarik/Vundle.vim'


" Vim color scheme
Plugin 'altercation/vim-colors-solarized'
" set t_Co=16
" let g:solarized_termcolors=16
set background=dark
colorscheme solarized


" Install NERDTree. FileSystem tree
Plugin 'scrooloose/nerdtree'


" Much better handling of filesystem tree and file openings in tabs
Plugin 'jistr/vim-nerdtree-tabs'

" Nerd tree maping to open files with Ctrl-n
map <C-n> :NERDTreeToggle<CR>

" Make Ctrl n use nerd tree tabs plugin. Overwrites the above configuration
map <Leader>n <plug>NERDTreeTabsOpen<CR>

let g:nerdtree_tabs_open_on_console_startup = 0


" Fuzzy finder -- absolutely must have
Plugin 'kien/ctrlp.vim'

" Use ctrl + 0 to find files
let g:ctrlp_map = '<c-o>'

" Let ctrlp have up to 30 results.
let g:ctrlp_max_height = 30


" Support for easily toggling comments. gcc to comment lines and more
Plugin 'tpope/vim-commentary'



" vim indents HTML very poorly on it's own. This fixes a lot of that.
Plugin 'indenthtml.vim'


" Correct Paste indentation issues
Plugin 'sickill/vim-pasta'


" Utility for quickly renaming files simply use :rename or :Rename
Plugin 'danro/rename.vim'


" Remove boring trailing whitespaces
Plugin 'ntpeters/vim-better-whitespace'
" autoremvoe trailing whitespaces on save
autocmd FileType * autocmd BufWritePre <buffer> StripWhitespace


" Automatic surroundings
Plugin 'tpope/vim-surround'


" Have vim auto-close [, ), <
Plugin 'spf13/vim-autoclose'
" Don't close comment caracter in vim files
let g:autoclose_vim_commentmode = 1


"Support for nodejs development
Plugin 'moll/vim-node'


" git Integration
Plugin 'tpope/vim-fugitive'


" Tag bar plugin.
Plugin 'majutsushi/tagbar'
" Map tag bar toogle to F8 ke
nmap <F8> :TagbarToggle<CR>


" Smart status bar
Plugin 'vim-airline/vim-airline'


" Super tabs
Bundle 'ervandew/supertab'

" Snippet engine
Plugin 'SirVer/ultisnips'

" Auto completion engine
Plugin 'ycm-core/YouCompleteMe'

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:ycm_goto_buffer_command = 'split-or-existing-window'
nnoremap <leader>go :YcmCompleter GoTo<CR>
nnoremap <leader>gv :rightbelow vertical YcmCompleter GoTo<CR>
nnoremap <leader>gr :YcmCompleter GoToReferences<CR>
nnoremap <leader>fi :YcmCompleter FixIt<CR>
nnoremap <leader>fo :YcmCompleter Format<CR>
nnoremap <leader>or :YcmCompleter OrganizeImports<CR>

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsListSnippets="<c-tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


" Snippet definitions
Plugin 'honza/vim-snippets'


" Git diff in a gutter
Plugin 'airblade/vim-gitgutter'
" vim-gitgutter used to do this by default:
highlight! link SignColumn LineNr
highlight link GitGutterChangeLine DiffText


" Rust language support
Plugin 'rust-lang/rust.vim'
" run rust format on save
let g:autofmt_autosave = 1


" Javascript support
Plugin 'pangloss/vim-javascript'


" typescript support
Plugin 'leafgarland/typescript-vim'


" JSX/TSX Support
Plugin 'maxmellon/vim-jsx-pretty'


" Mark down support
Plugin 'tpope/vim-markdown'


" LSP plugin
Plugin 'autozimu/languageclient-neovim'
" << LSP >> {{{
let g:LanguageClient_autoStart = 1
let g:LanguageClient_autoStop=1
nnoremap <leader>lcs :LanguageClientStart<CR>

" Install language servers and configure them to be used
let g:LanguageClient_serverCommands = {
   \ 'python': ['pyls'],
   \ }

noremap <silent> H :call LanguageClient_textDocument_hover()<CR>
noremap <silent> Z :call LanguageClient_textDocument_definition()<CR>
noremap <silent> R :call LanguageClient_textDocument_rename()<CR>
noremap <silent> S :call LanugageClient_textDocument_documentSymbol()<CR>
" }}}


" linting and more
Plugin 'dense-analysis/ale'
" enable eslint
let g:ale_linters = {
  \   'javascript': ['eslint'],
  \   'css': ['stylelint'],
  \}

" vim powerline support
" set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
set rtp+=/usr/local/lib/python3.7/dist-packages/powerline/bindings/vim/

" Always show statusline
set laststatus=2
" Use 256 colours (Use this setting only if your terminal supports 256colours)
" set t_Co=256
" Enable Vim ariline integration with powerline
let g:airline_powerline_fonts = 1

