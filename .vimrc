" Sat Feb 11 22:17:10 EST 2017 :r! date
" This file is organized based on the output of :options

" 1 commands ------------------------------------------------------------------------------------{{{
" <C-x> in insert mode
" }}}

" 1 important -----------------------------------------------------------------------------------{{{
" full features
set nocompatible
set encoding=utf-8
" }}}

" 2 moving around, searching and patterns -------------------------------------------------------{{{ 
" :find within subfolders
set path+=**
" }}}

" 3 tags ----------------------------------------------------------------------------------------{{{ 
" }}}

" 4 displaying text  ----------------------------------------------------------------------------{{{ 
" make whitespace visible with 'set list'
set listchars=tab:>~,nbsp:~,trail:~

set number
set nowrap
set linebreak
"}}}

" 5 syntax, highlighting and spelling -----------------------------------------------------------{{{ 
set colorcolumn=101
set cursorline
set hlsearch

syntax enable
colorscheme default
highlight colorcolumn ctermbg=lightgray
highlight Folded ctermbg=black ctermfg=lightgray
" not working
""augroup hilitestatus
""  autocmd!
""  autocmd InsertEnter * highlight StatusLine ctermbg=cyan ctermfg=black guibg=cyan guifg=black
""augroup END
" }}}

" 6 multiple windows  ---------------------------------------------------------------------------{{{ 
set hidden
set splitright
" show status line for last window
set laststatus=1  
cnoreabbrev help vert help
cnoreabbrev h vert help
cnoreabbrev sp vs
noremap <Left> <C-W><Left> 
noremap <Right> <C-W><Right> 
noremap <Up> :bn<cr>
noremap <Down> :bp<cr>
" }}}

" 7 multiple tab pages --------------------------------------------------------------------------{{{ 
" }}}

" 8 terminal  -----------------------------------------------------------------------------------{{{ 
" }}}

" 9 using the mouse  ----------------------------------------------------------------------------{{{ 
" enable mouse
set mouse=a
" }}}

" 10 GUI  ---------------------------------------------------------------------------------------{{{ 
if has("gui_running")
  highlight NORMAL guibg=black guifg=white
  highlight colorcolumn gui=reverse
  highlight cursorline guibg=black gui=underline
  highlight cursorlinenr guifg=#C4A000
  highlight Comment guifg=#3465A4
  highlight PreProc guifg=#75507B
  highlight Constant guifg=#CC0000
  highlight LineNr guifg=#C4A000
  highlight Folded guibg=black guifg=#EEEEEC
  highlight Special guifg=#75507B
  highlight type guifg=#4E9A06
  highlight statement guifg=#C4A000
  highlight Visual gui=reverse
  ""set guioptions -=m " hide menubar
  ""ret guioptions -=T " hide toolbar
  " hide right scrollbar
  set guioptions -=r
  set guifont=Consolas:h11
endif
" }}}

" 11 printing  ----------------------------------------------------------------------------------{{{
" }}}

" 12 messages and info  -------------------------------------------------------------------------{{{ 
" no sounds
set visualbell
set showcmd
set ruler
" }}}

" 13 selecting text  ----------------------------------------------------------------------------{{{ 
" }}}

" 14 editing text  ------------------------------------------------------------------------------{{{ 
set backspace=2
" }}}

" 15 tabs and indenting  ------------------------------------------------------------------------{{{ 
" size of tab in spaces
set tabstop=2

" turn tab into spaces
set expandtab

" turn auto tabs into spaces
set shiftwidth=2

" autoindent type (what is this?)
filetype indent on

" autoindent
set autoindent
" }}}

" 16 folding  -----------------------------------------------------------------------------------{{{ 
" code folding
set foldmethod=indent

" don't fold by default
set nofoldenable
" }}}

" 17 diff mode ----------------------------------------------------------------------------------{{{ 
" }}}

" 18 mappings and abbreviations  ----------------------------------------------------------------{{{ 
" kill arrows
""inoremap   <Up>     <NOP>
""inoremap   <Down>   <NOP>
""inoremap   <Left>   <NOP>
""inoremap   <Right>  <NOP>

noremap <Leader>v :e $MYVIMRC<CR>
noremap <Leader>w :w<cr>
noremap <Leader>q :q<cr>
""noremap <Leader>o :tabe
noremap <Leader>e :e 
""noremap :e :tabe
noremap <leader><leader> <esc>

" copy/paste to clipboard (requires installation of vim-gtk?)
noremap <leader>y "+y
noremap <leader>p "+p
inoremap <Leader>p <C-o>"+p

" markdown support
noremap <leader>h1 yypv$r=
noremap <leader>h2 yypv$r-
noremap <leader>h3 0i### 
noremap <leader>h4 0i#### 
noremap <leader>h5 0i##### 
noremap <leader>h6 0i###### 
vnoremap c <esc>o<esc>0i```<esc>`<i```<cr><esc>k$a

" echo syntax info of item under cursor (pasted)
noremap <Leader>syn :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>

" page up/down
noremap <C-j> <C-f>
noremap <C-k> <C-b>

" save file, run make, run prog. <C-U> on cmd line clears it, don't know why
noremap <F5> :w<CR> :<C-U>make && ./%:r<CR>
inoremap <F5> <ESC> :w<CR> :<C-U>make && ./%:r<CR>

" space toggles current fold
noremap <space> za

" step up/down through wrapped lines
noremap j gj
noremap k gk

" abbreviations
ab #b /***************************************
ab #e <space>****************************************/

" quote selected text
vnoremap " <esc>a"<esc>`<i"<esc>`>ll
vnoremap ' <esc>a'<esc>`<i'<esc>`>ll
vnoremap ( <esc>a)<esc>`<i(<esc>`>ll
vnoremap [ <esc>a]<esc>`<i[<esc>`>ll
vnoremap { <esc>a}<esc>`<i{<esc>`>ll
vnoremap ` <esc>a`<esc>`<i`<esc>`>ll

" filetype dependent commenting
augroup comments
  autocmd!
  autocmd FileType javascript nnoremap <buffer> <localleader>c I// <esc>
  autocmd FileType python     nnoremap <buffer> <localleader>c I# <esc>
augroup END
" }}}

" 19 reading and writing files ------------------------------------------------------------------{{{ 
" }}}

" 20 the swap file ------------------------------------------------------------------------------{{{ 
set directory=$HOME/.vimfiles/
" }}}

" 21 command line editing -----------------------------------------------------------------------{{{ 
" tab completion works like bash
set wildmode=longest,list,full
set wildmenu
" }}}

" 22 executing external commands ----------------------------------------------------------------{{{ 
" }}}

" 23 running make and jumping to errors ---------------------------------------------------------{{{ 
" }}}

" 24 language specific --------------------------------------------------------------------------{{{ 
" }}}

" 25 multi-byte characters ----------------------------------------------------------------------{{{ 
" }}}

" 26 various ------------------------------------------------------------------------------------{{{ 
let g:netrw_banner=0
" set explorer to tree style
let g:netrw_liststyle=3
nnoremap :E :Vexplore

" auto apply vimrc on save!
augroup reload_vimrc
  autocmd!
  autocmd bufwritepost $MYVIMRC source $MYVIMRC
augroup END

augroup templates
  autocmd!
  autocmd BufNewFile *.html 0r ~/.vimfiles/html.html | let IndentStyle = "html"
augroup END

augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END

cd ~
setlocal foldmethod=marker
" }}}

