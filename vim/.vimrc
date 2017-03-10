set nocompatible
set term=xterm

filetype indent on

" Settings
syntax on
set autoindent
set autoread
set background=dark
set backspace=2
set completeopt=menuone
set confirm
set display=lastline
set encoding=utf8
set expandtab
set fileencoding=utf8
set fileencodings=utf8,big5
" set foldmethod=syntax
set foldmethod=marker
set formatoptions+=j
" set foldnestmax=2
set hidden
set history=1024
set hlsearch
set ignorecase
set incsearch
set lazyredraw
" Show trailing whitespace
set list
" But only interesting whitespace
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:\ ,extends:>,precedes:<,nbsp:+
endif
set mouse=a
set number
set ruler
set shiftround
set shiftwidth=4
set showcmd
set showmatch
set showtabline=4
set smartcase
set smartindent
set softtabstop=4
set t_Co=256
set tabstop=2
set title
set titleold=
set undofile
set viewoptions=cursor,folds,slash,unix
set whichwrap=<,>
set wildmenu
colorscheme torte

" Custom keybinding
let mapleader=','
nnoremap ; :
nnoremap <BackSpace> gT
nnoremap <Tab> gt
nnoremap ` <C-w>w
nmap <silent> <leader>/ :nohlsearch<CR>
cmap w!! w !sudo tee % > /dev/null
noremap <S-Up> <Up>
noremap <S-Down> <Down>
inoremap <S-Up> <Up>
inoremap <S-Down> <Down>
nnoremap <leader>a <C-a>
nnoremap <leader>x <C-x>
vnoremap ; :
" imap {<CR> {<ESC>o}<ESC>%a<CR>
set pastetoggle=<F2>

" Save your swp files to a less annoying place than the current directory.
" If you have .vim-swap in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/swap, ~/tmp or .
if isdirectory($HOME . '/.vim/swap') == 0
  :silent !mkdir -p ~/.vim/swap >/dev/null 2>&1
endif
set directory=./.vim-swap//
set directory+=~/.vim/swap//
set directory+=~/tmp//
set directory+=.

if exists("+undofile")
  " undofile - This allows you to use undos after exiting and restarting
  " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
  " :help undo-persistence
  " This is only present in 7.3+
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif
  set undodir=./.vim-undo//
  set undodir+=~/.vim/undo//
  set undofile
endif

" Custom auto-complete menu colors
highlight PmenuSel ctermfg=white ctermbg=20
highlight Pmenu ctermfg=252 ctermbg=17

" Extra whitespace on line end.
highlight ExtraWhitespace ctermbg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
autocmd Syntax * normal zR

" Colors
highlight Folded ctermfg=243 ctermbg=234 guifg=Cyan guibg=DarkGrey
highlight FoldColumn ctermbg=234 guifg=Cyan guibg=Grey

" set laststatus=2
" set statusline=%=%1*
" set statusline+=%{getcwd()}/%f
" set statusline+=\ %2*[%{&encoding}/%{&fileformat}/%Y]
" set statusline+=\ %3*%l,%c
" set statusline+=\ %4*%-4P

nmap \c :!g++ % -std=c++14 -Wno-unused-result -Wall -Wshadow -Wconversion -Ofast -DLOCAL_TEST -o %< <CR>
nmap \p :!./%< <CR>
nmap \r :r ~/template.cpp<CR> ggdd :108<CR>A
