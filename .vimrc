" Alternative terminal type
"
" set term=xterm-color

syntax on
filetype on
filetype plugin indent on
filetype indent on
let mapleader = "," "Uses a comma to run leader commands
"
set nocompatible "Sets vim things always on, version discrepancy with vi
set modelines=0 "Modelines are risky, if I ever learn them comment this line
set hidden "Recommended for handling multiple buffers, not quite sure what does

"set term=builtin_ansi "Good for remote shells I think?
set ttyfast "Allows for faster scrolling. Maybe disable if using a remote term
set backspace=indent,eol,start "Backspaces across lines
set laststatus=2 "Displays file info at bottom
set autoread "Automatically reads outside changes

set ignorecase "If all lowercase, case insensitive
set smartcase "If at least one uppercase letter, case sensitive
set hlsearch "Highlight search results
set incsearch "Searches as typed
set gdefault "Defaults to global find/replace
nnoremap <leader><space> :noh<cr>

"set textwidth=80 "These two lines will wrap auto-wrap lines of code longer
"set nowrap         "than 80 lines. Just a warning to the user
set colorcolumn=80 "Where it will start wrapping

"I'm pretty sure the next three lines should be the same number
set softtabstop=2 "Number of columns that pressing tab indents
set shiftwidth=2 "This has something else to do with softtabstop
set expandtab "Uses spaces instead of tabs

set cursorline "Highlights the current line the cursor is on
set scrolloff=5 "At least five lines after cursor. Cursor can't get to buttom
set ruler "Shows cursor location in bottom right
set showcmd "Bottom line shows command information like 1dw

set cindent "Automatically lines up indents across lines
set showmatch "Shows the matching parenthesis or brace

function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <leader>l :call NumberToggle()<cr>
set relativenumber "Shows the line number
set visualbell "Instead of beeping diplays
set number

set wildmenu
set wildmode=list:longest

set list
set listchars=tab:▸\ ,eol:¬

"Tab moves to matching braces
nnoremap <tab> %
vnoremap <tab> %

"Faster window switching
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

"Quickly open up .vimrc by pressing leader + rc
nnoremap <leader>rc <C-w>v<C-w>l :e $MYVIMRC<cr>
"Opens a new vertical window
nnoremap <leader>w <C-w>v<C-w>l
"Quickly opens ,h in horizontal window by pressing leader+h
nnoremap <leader>h <C-w>s<C-w>k :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<cr> :resize 10<cr>

"Pressing j twice exits insert mode
inoremap jj <ESC>
inoremap jk <ESC>
inoremap kj <ESC>
inoremap kk <ESC>

"Syntax highlight for javascript
autocmd BufNewFile,BufRead *.json set ft=javascript
autocmd FileType text setlocal wrap linebreak 

"Semicolon can be used as a colon
nnoremap ; :
"Saves anytime focus is lost from the vim file
au FocusLost * :w
"auto remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

autocmd FileType make setlocal noexpandtab shiftwidth=8 softtabstop=0 "tabs are allowed if makefile
