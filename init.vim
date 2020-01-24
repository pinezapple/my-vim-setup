""call plug#begin('~/.vim/plugged')

 ""Plug 'tpope/vim-sensible'
 ""Plug 'junegunn/seoul256.vim'
 ""Plug 'itchyny/lightline.vim'
 ""Plug 'terryma/vim-multiple-cursors'
 ""Plug 'Xuyuanp/nerdtree-git-plugin'
 ""Plug 'scrooloose/nerdtree'
 ""Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
 ""Plug 'mileszs/ack.vim'
 ""Plug 'jlanzarotta/bufexplorer'
" Plug 'mdempsky/gocode', { 'rtp': 'vim', 'do':'~/.vim/plugged/gocode/vim/symlink.sh' }
 ""Plug 'jlanzarotta/bufexplorer'
 ""Plug 'ycm-core/YouCompleteMe', { 'do': './install.py' }
"" Plug 'Valloric/YouCompleteMe'
 ""Plug 'rust-lang/rust.vim'
""call plug#end()

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

 Plugin 'VundleVim/Vundle.vim'
 Plugin 'tpope/vim-sensible'
 Plugin 'junegunn/seoul256.vim'
 Plugin 'itchyny/lightline.vim'
 Plugin 'terryma/vim-multiple-cursors'
 Plugin 'Xuyuanp/nerdtree-git-plugin'
 Plugin 'scrooloose/nerdtree'
 Plugin 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
 Plugin 'mileszs/ack.vim'
 "Plugin 'mdempsky/gocode', { 'rtp': 'vim', 'do':'~/.vim/plugged/gocode/vim/symlink.sh' }
 Plugin 'jlanzarotta/bufexplorer'
 Plugin 'rust-lang/rust.vim'
 Plugin 'neomake/neomake'
 Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
 Plugin 'zchee/deoplete-go', {'do': 'make'}
call vundle#end()
filetype plugin indent on

set number
set nu
set ruler
set cursorline
set showmatch
set incsearch
set hlsearch
set ch=2
set showmode
set showcmd
set nocompatible
""set rtp+=~/.fzf

set omnifunc=syntaxcomplete#Complete

syntax on

autocmd vimenter * NERDTree

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

function! Smart_TabComplete()
  let line = getline('.')                         " current line
  let substr = strpart(line, -1, col('.')+1)      " from the start of the current
                                                  " line to one character right
                                                  " of the cursor
  let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
  if (strlen(substr)==0)                          " nothing to match on empty string
    return "\<tab>"
  endif
  let has_period = match(substr, '\.') != -1      " position of period, if any
  let has_slash = match(substr, '\/') != -1       " position of slash, if any
  if (!has_period && !has_slash)
    return "\<C-X>\<C-P>"                         " existing text matching
  elseif ( has_slash )
    return "\<C-X>\<C-F>"                         " file matching
  else
    return "\<C-X>\<C-O>"                         " plugin matching
  endif
endfunction

inoremap <tab> <c-r>=Smart_TabComplete()<CR>

nnoremap <silent> <S-N> :NERDTreeToggle<CR>
nnoremap <silent> <S-R> :NERDTreeRefreshRoot<CR>

nnoremap <silent> <S-h> <C-w>h
nnoremap <silent> <S-j> <C-w>j
nnoremap <silent> <S-k> <C-w>k
nnoremap <silent> <S-l> <C-w>l

nnoremap <silent> <C-h> <C-w><
nnoremap <silent> <C-j> <C-w>-
nnoremap <silent> <C-k> <C-w>+
nnoremap <silent> <C-l> <C-w>>

"bind yank to clipboard
""vmap <Leader>y "*y
"nmap <Leader>p "*p
nmap <Leader>p "+p
vmap <leader>y "+y
set clipboard=unnamedplus

"Auto complete Bracket
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

"Setup for tab omnifunc auto complete
""function! BufSel(pattern)
"" let bufcount = bufnr("$")
""  let currbufnr = 1
""  let nummatches = 0
""  let firstmatchingbufnr = 0
""  while currbufnr <= bufcount
""    if(bufexists(currbufnr))
""      let currbufname = bufname(currbufnr)
""      if(match(currbufname, a:pattern) > -1)
""        echo currbufnr . ": ". bufname(currbufnr)
""        let nummatches += 1
""        let firstmatchingbufnr = currbufnr
""      endif
""    endif
"   let currbufnr = currbufnr + 1
""  endwhile
""  if(nummatches == 1)
""    execute ":buffer ". firstmatchingbufnr
""  elseif(nummatches > 1)
""    let desiredbufnr = input("Enter buffer number: ")
""    if(strlen(desiredbufnr) != 0)
""      execute ":buffer ". desiredbufnr
""    endif
""""  else
""    echo "No matching buffers"
""  endif
""endfunction

"Bind the BufSel() function to a user-command
command! -nargs=1 Bs :call BufSel("<args>")

" Buffers - explore/next/previous: Alt-F12, F12, Shift-F12.
nnoremap <silent> <M-F12> :BufExplorer<CR>
nnoremap <silent> <F12> :bn<CR>
nnoremap <silent> <S-F12> :bp<CR>

"Deoplete"
let g:deoplete#enable_at_startup = 1
let g:python3_host_prog = "/usr/bin/python3.6"
