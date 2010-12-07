" -----------------------------------------------------------------------------
"  VIM Settings 
"  (see gvimrc for gui vim settings) 
" -----------------------------------------------------------------------------


" Bundle based plugin management via Pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

"Set Mapleader
let mapleader = ","
let g:mapleader = ","

set nocompatible
 
" Tabs 
set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab
set sta " a <Tab> in an indent inserts 'shiftwidth' spaces
 
 
" Indenting
set ai " Automatically set the indent of a new line (local to buffer)
set si " smartindent  (local to buffer)
 
 
" Scrollbars 
set sidescrolloff=2
set numberwidth=4
 
 
" Windows 
set equalalways " Multiple windows, when created, are equal in size
set splitbelow splitright
 
"Vertical split then hop to new buffer
:noremap ,v :vsp^M^W^W<cr>
:noremap ,h :split^M^W^W<cr>
 
 
" Cursor highlights 
"set cursorline
"set cursorcolumn
 
 
" Searching 
set hlsearch " highlight search
set incsearch " incremental search, search as you type
set ignorecase " Ignore case when searching
set smartcase " Ignore case when searching lowercase
 
 
" Colors 
set t_Co=256 " 256 colors
set background=dark
syntax on " syntax highlighting
colorscheme blackboard
 
 
" Status Line 
set showcmd
set ruler " Show ruler
"set ch=2 " Make command line two lines high
 
 
" Line Wrapping 
set nowrap
set linebreak " Wrap at word
 
 
" Mappings 
" Professor VIM says '87% of users prefer jj over esc', jj abrams strongly disagrees
imap jj <Esc>
imap uu _
imap hh =>
imap aa @filetype plugin indent on
