" v0.1 2012-10-22 Philip Thrasher
" Basics script copied from https://gist.github.com/pthrasher/3933522 
" For this to work, you must install the vundle plugin manually.
" https://github.com/gmarik/vundle
" To install vundle, copy all the files from the repo into your respective
" folders within ~/.vim
"
set nocompatible " Fuck VI... That's for grandpas.
filetype off     
 
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()
 
" Vundle let's you specify a plugin in a number of formats, but my favorite
" allows you to grab plugins straight off of github, just specify the bundle
" in the following format:
" Bundle 'githubUsername/repoName'

" Let vundle manage itself:
Plugin 'gmarik/Vundle.vim'

" Allow custom project configuration
Plugin 'embear/vim-localvimrc'

" Install NERDTree. FileSystem tree
Plugin 'scrooloose/nerdtree'

" Much better handling of filesystem tree and file openings in tabs
Plugin 'jistr/vim-nerdtree-tabs'

" Fuzzy finder -- absolutely must have.
Plugin 'kien/ctrlp.vim'
 
" Support for easily toggling comments.
Plugin 'tpope/vim-commentary'
 
" In addtion to the above plugins, you'll likely need some for individual
" non-standard syntaxes that aren't pre-bundled with vim. Here are some I use,
" these are required for me, but depending on what code you write, obviously
" this may differ for you.
 
" Proper JSON filetype detection, and support.
Plugin 'leshill/vim-json'
 
" vim already has syntax support for javascript, but the indent support is
" horrid. This fixes that.
Plugin 'pangloss/vim-javascript'
 
" vim indents HTML very poorly on it's own. This fixes a lot of that.
Plugin 'indenthtml.vim'
 
" I write markdown a lot. This is a good syntax.
Plugin 'tpope/vim-markdown'
 
" LessCSS -- I use this every day.
" Bundle 'groenewege/vim-less'
 
" Coffee-script syntax.
" Bundle 'kchmck/vim-coffee-script'

" Correct Paste indentation issues
Plugin 'sickill/vim-pasta'

" Utility for quickly renaming files simply use :rename or :Rename
Plugin 'danro/rename.vim'

" Remove boring trailing whitespaces
Plugin 'jakobwesthoff/whitespacetrail'

" Automatic surroundings
Plugin 'tpope/vim-surround'


" Track the engine.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" Syntastic code analyser
Plugin 'scrooloose/syntastic'

" Use neo complete cache plugin. use neocomplete if luas is enabled.
Plugin 'Shougo/neocomplete.vim'

" necomplete companion
" Plugin 'Shougo/neosnippet.vim'
Plugin 'Shougo/neosnippet.vim'
Plugin 'Shougo/neosnippet-snippets'
" Have vim auto-close [, ), <
Plugin 'spf13/vim-autoclose'

" Php Integration for VIM PIV Plugin
" 'Bundle 'spf13/PIV'


" Another syntax checker
"Bundle 'tomtom/checksyntax_vim'

" Tag bar plugin.
" Plugin 'majutsushi/tagbar'

" Handle jade templates
" Plugin ''digitaltoad/vim-jade'

" Vim editor for AngularJs
" Plugin 'burnettk/vim-angular'

" Vim Javascript plugin
Plugin 'othree/javascript-libraries-syntax.vim'

" Making unit testing easy with Jasmine 
Plugin 'claco/jasmine.vim'

" let only local .vimrc be loaded without asking confirmation
" let g:localvimrc_blacklist='.vimrc'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"let g:UltiSnipsSnippetDirectories=["UltiSnips"]

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Map tag bar toogle to F8 key
" nmap <F8> :TagbarToggle<CR>

" We have to turn this stuff back on if we want all of our features.
filetype plugin indent on " Filetype auto-detection
syntax on " Syntax highlighting

set backspace=2 "make backspace work like othe apps
set tabstop=4
set shiftwidth=4
set softtabstop=4
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
 
" allow the cursor to go anywhere in visual block mode.
set virtualedit+=block
 
" leader is a key that allows you to have your own "namespace" of keybindings.
" You'll see it a lot below as <leader>
let mapleader = ","
 
 
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
 
" Plugin settings:
" Below are some 'sane' (IMHO) defaults for a couple of the above plugins I
" referenced.
 
" Map the key for toggling comments with vim-commentary
nnoremap <leader>c <Plug>CommentaryLine
 
" Remap ctrlp to ctrl-t -- map it however you like, or stick with the
" defaults. Additionally, in my OS, I remap caps lock to control. I never use
" caps lock. This is highly recommended.
let g:ctrlp_map = '<c-o>'
 
" Let ctrlp have up to 30 results.
let g:ctrlp_max_height = 30

" Nerd tree maping to open files with Ctrl-n
map <C-n> :NERDTreeToggle<CR>

" Make Ctrl n use nerd tree tabs plugin. Overwrites the above configuration
map <Leader>n <plug>NERDTreeTabsOpen<CR>

let g:nerdtree_tabs_open_on_console_startup = 0

" Don't close comment caracter in vim files
let g:autoclose_vim_commentmode = 1
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
"" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
       \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
   let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  "return neocomplete#close_popup() . "\<CR>"
     " For no inserting <CR> key.
   return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

" AutoCOmplPop like behavior : autoselect
let g:neocomplete#enable_auto_select = 1

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#omni#input_patterns = {}
endif
" let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
" let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
" let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
" Javascript autocomplete library supported
let g:used_javascript_libs = 'underscore,jquery,angularjs,angularui'
let g:syntastic_javascript_checkers = ['jshint']
