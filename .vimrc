"==========
"
"==========

" use 256 colors palette - must be set before color scheme is choosen
set t_Co=256

" Don't touch
set nocompatible               " be iMproved
filetype off                   " required!

" setup Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"==========
" Plugins
"==========
Bundle 'gmarik/vundle'
Bundle 'L9'

" NerdTree -displays a neat file explorer window
Bundle 'The-NERD-tree'
" command-T - file opener/finder
Bundle 'Command-T'
" SuperTab for autcompletion in insert mode
Bundle 'SuperTab'


"==========
" Ruby on Rails

" FuzzyFinder - finally I can go to a class or method like in RubyMine
Bundle 'FuzzyFinder'

" vim-endwise - wisely add 'end' in ruby
Bundle 'endwise.vim'

" vim-matchit - better pair matching for the % command
Bundle 'matchit.zip'

" vim-rake - :Rake, :A, :R like in rails.vim, but without rails
" Bundle 'tpope/vim-rake'

" vim-rake - :Rake, :A, :R like in rails.vim, but without rails
" Bundle 'tpope/vim-fugitive'

" vim-rails - awesome vim-rails integration
Bundle 'tpope/vim-rails.git'

" vim-ruby
Bundle 'ruby.vim'

" delimitMate - autoclosing of (", etc. that does not clash with endwise
Bundle 'delimitMate.vim'


"=========
" Others

" syntastic - plugin for displaying syntax errors
Bundle 'Syntastic'

Bundle 'git://git.wincent.com/command-t.git'

" Indentation guides
Bundle 'https://github.com/nathanaelkane/vim-indent-guides'
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=darkgrey



" ============================================
" config
" ============================================
syntax enable                     " Turn on syntax highlighting.
filetype plugin indent on         " Turn on file type detection.

runtime macros/matchit.vim        " Load the matchit plugin.

set encoding=utf-8                " Default encoding

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set showbreak=...                 " Show break lines

set backspace=indent,eol,start    " Intuitive backspacing.
set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set number                        " Show line numbers.
set ruler                         " Show cursor position.

set history=1000                  " remember more commands and search history
set undolevels=1000               " use many muchos levels of undo

set virtualedit=block             " allow the cursor to go into invalid places only in visual block mode

" Display tabs and trailing spaces

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

set wrap                          " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

set title                         " Set the terminal's title

set visualbell                    " No beeping.

set splitbelow splitright         " Splitting behavior

set nobackup                      " Don't make a backup before overwriting a file.
set noswapfile                    " Don't keep swap files
set nowritebackup                 " And again.

set tabstop=2                     " Global tab width.
set shiftwidth=2                  " And again, related.
set expandtab                     " Use spaces instead of tabs
set shiftround                    " use multiple of shiftwidth when indenting with '<' and '>'
set laststatus=2                  " Show the status line all the time

set confirm                       " confirm on quit, etc.
set autoread                      " automatically read changes from disk

set diffopt+=iwhite               " ignore whitespace in vimdiff

" Folding settings
set foldmethod=indent             " indent based on syntax
set foldnestmax=3                 " deepest fold is 3 levels
set foldlevel=3
set nofoldenable                  " dont fold by default

"set matchpairs+=<:>               " add < and > to the chars thac can be navigated with %

" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

" semicolon instead of a colon for commands
"nnoremap ; :

" j and k will navigate correctly in the wrapped lines
nnoremap j gj
nnoremap k gk

" map .md files fo markdown
au BufNewFile,BufRead *.md set filetype=markdown

" automatically strip trailing whitespace for some file types
autocmd FileType c,cpp,java,php,javascript,html,ruby autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

au! BufRead,BufNewFile *.json setfiletype json
autocmd FileType json set equalprg=json_reformat

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" set some different setting for the diff mode
if &diff
  colorscheme fu_patched " different scheme
  set nonumber " no line numbers
endif

" NERDTree
let g:NERDChristmasTree = 1
let g:NERDTreeMapOpenSplit = "s"
let g:NERDTreeMapOpenVSplit = "v"

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_enable_signs=1
let g:syntastic_disabled_filetypes = ['eruby']

" some plugin was overriding the redo command
nmap <silent> <c-r> :redo<cr>

"key mapping for saving file
nmap <C-s> :w<CR>
imap <C-s> <ESC>:w<CR><ESC>

"map leadder p to nerdtree
silent! nmap <silent> <Leader>p :NERDTreeToggle<CR>

"Move line(s) of text down/up using Alt+j/k
nnoremap <silent> <A-j> :m+<CR>==
nnoremap <silent> <A-k> :m-2<CR>==
inoremap <silent> <A-j> <Esc>:m+<CR>==gi
inoremap <silent> <A-k> <Esc>:m-2<CR>==gi
vnoremap <silent> <A-j> :m'>+<CR>gv=gv
vnoremap <silent> <A-k> :m-2<CR>gv=gv

" Format all file
nmap <C-f> gg=<S-G>

" Command-t max height
let g:CommandTMaxHeight = 15


"  ---------------------------------------------------------------------------
"  Ruby/Rails
"  ---------------------------------------------------------------------------

" Edit routes
command! Rroutes :Redit config/routes.rb
command! RTroutes :RTedit config/routes.rb

" Edit factories
command! Rfactories :Redit spec/factories.rb
command! RTfactories :RTedit spec/factories.rb

" Execute current buffer as ruby
map <S-r> :w !ruby<CR>

map <leader>gv :CommandTFlush<cr>\|:CommandT app/views<cr>
map <leader>gc :CommandTFlush<cr>\|:CommandT app/controllers<cr>
map <leader>gm :CommandTFlush<cr>\|:CommandT app/models<cr>
map <leader>gh :CommandTFlush<cr>\|:CommandT app/helpers<cr>
map <leader>gl :CommandTFlush<cr>\|:CommandT lib<cr>
map <leader>gp :CommandTFlush<cr>\|:CommandT public<cr>
map <leader>ga :CommandTFlush<cr>\|:CommandT app/assets<cr>
map <leader>gf :CommandTFlush<cr>\|:CommandT ./<cr>





" Resizing vertical splits
map <right> <C-W>>
map <left>  <C-W><
map <up>    <C-W>+
map <down>  <C-W>-

colorscheme default
set background=dark

" ruby autocomplete
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
" if you want buffer/rails/global completion you must add the following:
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
" if you want rails support add the following in addition
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
" if you want classes included in global completions add the following
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
