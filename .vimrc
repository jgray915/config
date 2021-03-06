"test Sat Feb 11 22:17:10 EST 2017 :r! date
" This file is organized based on the output of :options

" open gvim maximized on windows
au GUIEnter * simalt ~x

let $HOME = $USERPROFILE
set runtimepath=~/vimfiles,$VIMRUNTIME
cd ~
set autochdir
set ignorecase
" search is case sensitive if it includes capitals, otherwise insensitive. requires set ignorecase
set smartcase 

" 0 commands ------------------------------------------------------------------------------------{{{
" FOCUS ON MOTIONS AND OPERATORS
" <C-x> in insert mode for completion mode
" <C-p> complete from previous in text
" <C-r> in insert mode to put from register
"   /<C-r> + => find text in clipboard
" .  Dot! Repeat the change you just made!
" i prefix, iw, ip, i", i(, as a sentence!, it inner tags
" f finds! f. => move char to next . cf. changes to next .!
" / search is a movement! c/foo changes up to foo!
" ma to set mark a. 'a goes to 0 of line of mark, `a returns to mark
" y prefix! prefix y with register ("a, "b, etc) to yank into that register
" P capital p to paste before rather than after
" recording macros just records keypresses into a register, so y or d into register can be executed
" possible plugins: surround, commentary
" * in normal to search word on the cursor

" The following enables omnicomplete with <c-x><c-o>
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" add kspell to complete to complete from dictionary when spell is on
set complete+=kspell
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
set relativenumber
" don't wrap on file load
set nowrap
" don't wrap while typing, including comments
set formatoptions-=t
set formatoptions-=c
set textwidth=100
"}}}

" 5 syntax, highlighting and spelling -----------------------------------------------------------{{{ 
" set colorcolumn=101
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
  highlight Search guifg=black
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

noremap :Q :q
noreabbrev wq w<bar>bdelete
noremap :q :bdelete
noremap <Leader>v :e $MYVIMRC<CR>
noremap <Leader>w :w<cr>
noremap <Leader>q :bdelete
""noremap <Leader>o :tabe
noremap <Leader>e :e 
""noremap :e :tabe
noremap <leader><leader> <esc>:noh<Return>
noremap <esc> <esc>:noh<Return>

" copy/paste to clipboard (requires installation of vim-gtk?)
""noremap <leader>y "+y
""noremap <leader>p "+p
""inoremap <Leader>p <C-o>"+p

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
"noremap <F5> :w<CR> :<C-U>make && ./%:r<CR>
"inoremap <F5> <ESC> :w<CR> :<C-U>make && ./%:r<CR>

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

" find currently highlighted text
vnoremap / "vy <esc> /<C-r>v<RETURN>

" filetype dependent commenting
augroup comments
  autocmd!
  autocmd FileType javascript nnoremap <buffer> <localleader>c I// <esc>
  autocmd FileType python     nnoremap <buffer> <localleader>c I# <esc>
augroup END

" WIP: search all open files
""noremap :vgrep :bufdo vimgrepadd the % | copen

" }}}

" 19 reading and writing files ------------------------------------------------------------------{{{ 
" }}}

" 20 the swap file ------------------------------------------------------------------------------{{{ 
set directory=~/vimfiles/
set backupdir=~/vimfiles/
" }}}

" 21 command line editing -----------------------------------------------------------------------{{{ 
" tab completion works like bash
set wildmode=longest,list,full
set wildmenu
" }}}

" 22 executing external commands ----------------------------------------------------------------{{{ 
" On Windows, open current file in Chrome
nnoremap <F5> :update<Bar>silent !start "C:\\Program Files (x86)\Google\Chrome\Application\chrome.exe" "file://%:p<CR>
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
  autocmd BufNewFile *.html 0r ~/vimfiles/html.html | let IndentStyle = "html"
augroup END

augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END

setlocal foldmethod=marker
" }}}

execute pathogen#infect()

let NERDTreeShowBookmarks=1
""autocmd VimEnter * NERDTree
