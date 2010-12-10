" -----------------------------------------------------------------------------
"  VIM Settings 
"  (see gvimrc for gui vim settings) 
" -----------------------------------------------------------------------------


" Bundle based plugin management via Pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

"Set Mapleader
let mapleader = ","
let g:mapleader = ","

nmap <leader>V :tabedit $MYVIMRC<CR>

set nocompatible
 
" Tabs 
set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab
set sta " a <Tab> in an indent inserts 'shiftwidth' spaces
 
if has("autocmd")
  " Enable file type detection
  filetype on

  " Syntax of these languages is fussy over tabs vs spaces
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

  " Customizations based on person preferences
  autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab
  autocmd FileType text setlocal ts=2 sts=2 sw=2 expandtab formatoptions=taq 
  autocmd FileType markdown setlocal ts=2 sts=2 sw=2 expandtab formatoptions=taq tw=80

  " Treat .rss files as XML
  autocmd BufNewFile,BufRead *.rss setfiletype xml
endif

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
 
" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Shortcuts to open file in browsers 
nmap <leader>s :!open -a Safari %<CR><CR>
nmap <leader>c :!open -a Google\ Chrome %<CR><CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" Colors 
set t_Co=256 " 256 colors
set background=dark
syntax on " syntax highlighting
colorscheme blackboard
 
" Line numbers
set number

" Status Line 
set showcmd
set ruler " Show ruler
"set ch=2 " Make command line two lines high
 
 
" Line Wrapping 
set wrap
set linebreak " Wrap at word
 
 
" Mappings 
" Professor VIM says '87% of users prefer jj over esc', jj abrams strongly disagrees
imap jj <Esc>
imap uu _
imap hh =>
imap aa @filetype plugin indent on

" Set tabstop, softtabstop and shiftwidth to the same value
command! -nargs=* Stab call Stab()
function! Stab()
  let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
  if l:tabstop > 0
    let &l:sts = l:tabstop
    let &l:ts = l:tabstop
    let &l:sw = l:tabstop
  endif
  call SummarizeTabs()
endfunction
 
function! SummarizeTabs()
  try
    echohl ModeMsg
    echon 'tabstop='.&l:ts
    echon ' shiftwidth='.&l:sw
    echon ' softtabstop='.&l:sts
    if &l:et
      echon ' expandtab'
    else
      echon ' noexpandtab'
    endif
  finally
    echohl None
  endtry
endfunction

function! Preserve(command)
  " Preparation save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l,c)
endfunction
" Strip trailing white spaces
nmap _$ :call Preserve("%s/\\s\\+$//e")<CR> 
" Indent entire file
nmap _= :call Preserve("normal gg=G")<CR>
