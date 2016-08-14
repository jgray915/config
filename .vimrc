" Sun Jul 24 23:22:46 EDT 2016   :r! date
" This file is organized based on the output of :options

" 1 important 
"===================================================================================================
  " full features
  set nocompatible
" 2 moving around, searching and patterns 
"===================================================================================================
" 3 tags  
"===================================================================================================
" 4 displaying text 
"===================================================================================================
  " make tabs, nbsps, trailing whitespace visible
  ""set listchars=tab:>~,nbsp:~,trail:~
  ""set list

  set number
  set nowrap
" 5 syntax, highlighting and spelling 
"===================================================================================================
  set colorcolumn=101
  set cursorline
  set hlsearch
 
  syntax enable
  colorscheme default
  ""highlight NORMAL ctermbg=black ctermfg=white 
  highlight colorcolumn ctermfg=red ctermbg=black
  ""highlight cursorline cterm=none ctermbg=black 
  ""highlight cursorlinenr cterm=none ctermbg=black
  ""highlight Comment ctermfg=darkcyan
  ""highlight PreProc ctermfg=cyan
  ""highlight Constant ctermfg=red
  ""highlight LineNr ctermfg=cyan
  ""highlight Folded ctermbg=black ctermfg=darkgray 
  ""highlight Special ctermfg=darkred 
  ""highlight StatusLine ctermbg=black ctermfg=darkgray 
  ""au InsertLeave * highlight StatusLine ctermbg=gray ctermfg=darkgray 
  ""au InsertEnter * highlight StatusLine ctermbg=cyan ctermfg=cyan 
" 6 multiple windows 
"===================================================================================================
" 7 multiple tab pages 
"===================================================================================================
" 8 terminal 
"===================================================================================================
" 9 using the mouse 
"===================================================================================================
  " enable mouse
  set mouse=a
" 10 GUI 
"===================================================================================================
" 11 printing 
"===================================================================================================
" 12 messages and info 
"===================================================================================================
  " no sounds
  set visualbell

  set showcmd
" 13 selecting text 
"===================================================================================================
" 14 editing text 
"===================================================================================================
" 15 tabs and indenting 
"===================================================================================================
  " size of tab in spaces
  set tabstop=2
  
  " turn tab into spaces
  set expandtab

  " turn auto tabs into spaces
  set shiftwidth=2

  " autoindent type
  filetype indent on      

  " autoindent
  set autoindent          

  " Open all buffers in tabs
  augroup BufInTabs
    autocmd!
    autocmd BufEnter * call HelpInNewTab()
  augroup END

  " Open all buffers in tabs
  function! HelpInNewTab()
    execute "normal \<C-W>T"
  endfunction
" 16 folding 
"===================================================================================================
  " code folding
  set foldmethod=indent   

  " don't fold by default
  set nofoldenable        
" 17 diff mode 
"===================================================================================================
" 18 mappings and abbreviations 
"===================================================================================================
  " kill arrows
  ""inoremap  <Up>     <NOP>
  ""inoremap  <Down>   <NOP>
  ""inoremap  <Left>   <NOP>
  ""inoremap  <Right>  <NOP>
  ""noremap   <Up>     <NOP>
  ""noremap   <Down>   <NOP>
  ""noremap   <Left>   <NOP>
  ""noremap   <Right>  <NOP>
 
  noremap <Leader>v :tabe $MYVIMRC<CR>
  noremap <Leader>w :w<cr>
  noremap <Leader>q :q<cr>
  noremap <Leader>o :tabe 
  noremap <Leader>e :tabe 
  noremap :e :tabe
  inoremap <leader><leader> <esc>
  
  " copy/paste to clipboard (requires installation of vim-gtk?)
  vnoremap <Leader>y "+y
  noremap <Leader>p "+p
  inoremap <Leader>p <C-o>"+p

  " echo syntax info of item under cursor (pasted)
  noremap <Leader>syn :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>

  " page up/down
  noremap <C-j> <C-f> 
  noremap <C-k> <C-b>

  " save file, run make, run prog. <C-U> on cmd line clears it, don't know why
  noremap <F5> :w<CR> :<C-U>make && ./%:r<CR>
  inoremap <F5> <ESC> :w<CR> :<C-U>make && ./%:r<CR>

  " space toggles current fold
  ""noremap <space> za

  " step up/down through wrapped lines
  map j gj
  map k gk

  " abbreviations
  ab #b /***************************************
  ab #e <space>****************************************/
  au BufNewFile *.html 0r ~/.vimfiles/html.html | let IndentStyle = "html"
" 19 reading and writing files
"===================================================================================================
" 20 the swap file
"===================================================================================================
" 21 command line editing
"===================================================================================================
  " tab completion works like bash
  set wildmode=longest,list,full
  set wildmenu
" 22 executing external commands
"===================================================================================================
" 23 running make and jumping to errors
"===================================================================================================
" 24 language specific
"===================================================================================================
" 25 multi-byte characters
"===================================================================================================
" 26 various
"===================================================================================================
  " set explorer to tree style
  let g:netrw_liststyle=3

  " auto apply vimrc on save!
  augroup reload_vimrc  
    autocmd!
    autocmd bufwritepost $MYVIMRC source $MYVIMRC
  augroup END  
