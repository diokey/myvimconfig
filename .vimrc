" v0.1 2012-10-22 Philip Thrasher
" Basics script copied from https://gist.github.com/pthrasher/3933522 
" For this to work, you must install the vundle plugin manually.
" https://github.com/gmarik/vundle
" To install vundle, copy all the files from the repo into your respective
" folders within ~/.vim
"
set nocompatible " Fuck VI... That's for grandpas.
filetype off     
 
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
 
" Vundle let's you specify a plugin in a number of formats, but my favorite
" allows you to grab plugins straight off of github, just specify the bundle
" in the following format:
" Bundle 'githubUsername/repoName'
 
" Let vundle manage itself:
Bundle 'gmarik/vundle'

" Install NERDTree. FileSystem tree
Bundle 'scrooloose/nerdtree'

" Much better handling of filesystem tree and file openings in tabs
Bundle 'jistr/vim-nerdtree-tabs'

" Fuzzy finder -- absolutely must have.
Bundle 'kien/ctrlp.vim'
 
" Support for easily toggling comments.
Bundle 'tpope/vim-commentary'
 
" In addtion to the above plugins, you'll likely need some for individual
" non-standard syntaxes that aren't pre-bundled with vim. Here are some I use,
" these are required for me, but depending on what code you write, obviously
" this may differ for you.
 
" Proper JSON filetype detection, and support.
Bundle 'leshill/vim-json'
 
" vim already has syntax support for javascript, but the indent support is
" horrid. This fixes that.
Bundle 'pangloss/vim-javascript'
 
" vim indents HTML very poorly on it's own. This fixes a lot of that.
Bundle 'indenthtml.vim'
 
" I write markdown a lot. This is a good syntax.
Bundle 'tpope/vim-markdown'
 
" LessCSS -- I use this every day.
Bundle 'groenewege/vim-less'
 
" Coffee-script syntax.
Bundle 'kchmck/vim-coffee-script'

" Correct Paste indentation issues
Bundle 'sickill/vim-pasta'

" Utility for quickly renaming files simply use :rename or :Rename
Bundle 'danro/rename.vim'

" Remove boring trailing whitespaces
Bundle 'jakobwesthoff/whitespacetrail'

" Automatic surroundings
Bundle 'tpope/vim-surround'

" Have vim auto-close [, ), <
Bundle 'spf13/vim-autoclose'

" Use neo complete cache plugin. use neocomplete if luas is enabled.
" Bundle 'Shougo/neocomplete.vim'
Bundle 'Shougo/neocomplcache.vim'

" Php Integration for VIM PIV Plugin
Bundle 'spf13/PIV'

" Track the engine.
Bundle 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Bundle 'honza/vim-snippets'

" Syntastic code analyser
Bundle 'scrooloose/syntastic'

" Another syntax checker
Bundle 'tomtom/checksyntax_vim'

" Tag bar plugin.
Bundle 'majutsushi/tagbar'

" Handle jade templates
Bundle "digitaltoad/vim-jade"

" Vim editor for AngularJs
Plugin 'burnettk/vim-angular'

" Vim Javascript plugin
Plugin 'othree/javascript-libraries-syntax.vim'

" Making unit testing easy with Jasmine 
Plugin 'claco/jasmine.vim'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-y>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetDirectories=["UltiSnips"]

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Map tag bar toogle to F8 key
nmap <F8> :TagbarToggle<CR>

" We have to turn this stuff back on if we want all of our features.
filetype plugin indent on " Filetype auto-detection
syntax on " Syntax highlighting
 
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

let g:nerdtree_tabs_open_on_console_startup = 1

" Don't close comment caracter in vim files
let g:autoclose_vim_commentmode = 1
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
"" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Enable heavy features.
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
       \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
   let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
     " For no inserting <CR> key.
     return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
 let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
" Javascript autocomplete library supported
let g:used_javascript_libs = 'underscore,backbone,jquery,angularjs,angularui'
let g:syntastic_javascript_checkers = ['jshint']
