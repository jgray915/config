"Sun Jul 24 23:22:46 EDT 2016   :r! date

""*  General  *""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    set nocompatible
    set showcmd
    let g:netrw_liststyle=3 "set explorer to tree style
    set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar
    set guioptions-=r  "remove right-hand scroll bar
    set guioptions-=L  "remove left-hand scroll bar
    set laststatus=2
    set colorcolumn=81
    set cursorline
    set number
    set mouse=a             "enable mouse
    set tabstop=2           "size of tab in spaces
    set expandtab           "turn tab into spaces
    set shiftwidth=2        "turn auto tabs into spaces
    set foldmethod=indent   "code folding
    set nofoldenable        "don't fold by default
    noremap <space> za      "space toggles current fold
    filetype indent on      "autoindent
    set autoindent          "autoindent
    set nowrap
    set showcmd
    set visualbell          "no sounds
    "tab completion works like bash
        set wildmode=longest,list,full
        set wildmenu
    "step up/down through wrapped lines
        map j gj
        map k gk
    "kill arrows
    "    inoremap  <Up>     <NOP>
    "    inoremap  <Down>   <NOP>
    "    inoremap  <Left>   <NOP>
    "    inoremap  <Right>  <NOP>
    "    noremap   <Up>     <NOP>
    "    noremap   <Down>   <NOP>
    "    noremap   <Left>   <NOP>
    "    noremap   <Right>  <NOP>
    "make tabs, nbsps, trailing whitespace visible
        "set listchars=tab:>~,nbsp:~,trail:~
        "set list
    "auto apply vimrc on save!
    augroup reload_vimrc " {
        autocmd!
        autocmd bufwritepost $MYVIMRC source $MYVIMRC
    augroup END " }
    "page up/down
        noremap <C-j> <C-f>
        noremap <C-k> <C-b>
""*  Abbreviations  *"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    ab #b /***************************************
    ab #e <space>****************************************/
    au BufNewFile *.html 0r ~/vimfiles/html.html | let IndentStyle = "html"
""*  Leaders  *"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    noremap <Leader>v :tabe $MYVIMRC<CR>
    noremap <Leader>w :w<cr>
    noremap <Leader>q :q<cr>
    noremap <Leader>o :tabe 
    noremap <Leader>e :tabe 
    noremap :e :tabe
    inoremap <leader><leader> <esc>
    "copy/paste to clipboard
        vnoremap <Leader>y "+y
        noremap <Leader>p "+p
        inoremap <Leader>p <C-o>"+p
    "echo syntax info of item under cursor (pasted)
    noremap <Leader>syn :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>
    "save file, run make, run prog. <C-U> on cmd line clears it, don't know why
    noremap <F5> :w<CR> :<C-U>make && ./%:r<CR>
    inoremap <F5> <ESC> :w<CR> :<C-U>make && ./%:r<CR>
""*  Colors  *""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    syntax enable
    colorscheme default
    set t_Co=256
    set background=dark
    highlight NORMAL ctermbg=black ctermfg=white guibg=#222222 guifg=#FFFFFF
    highlight colorcolumn ctermbg=darkgray guibg=#272727
    highlight cursorline cterm=none ctermbg=black gui=none guibg=#000000
    highlight cursorlinenr cterm=none ctermbg=black gui=none guibg=#222222 guifg=#00AACC
    highlight Comment ctermfg=darkcyan guifg=#447744
    highlight PreProc ctermfg=cyan guifg=#00AAAA
    highlight Constant ctermfg=red guifg=#FFAA77
    highlight LineNr ctermfg=cyan guifg=#00AACC
    highlight Folded ctermbg=black ctermfg=darkgray guibg=#222222 guifg=#777777
    highlight Special ctermfg=darkred guifg=#880000
    highlight StatusLine ctermbg=black ctermfg=darkgray guibg=#000000 guifg=#444444
    highlight type guifg=#55AADD
    highlight statement guifg=#55AADD
    au InsertLeave * highlight StatusLine ctermbg=black ctermfg=darkgray guibg=#000000 guifg=#444444
    au InsertEnter * highlight StatusLine ctermbg=black ctermfg=cyan guibg=#000000 guifg=#00FFFF
    "set font
        if has("gui_running")
            if has("gui_gtk2")
                set guifont=Inconsolata\ 10
            elseif has("gui_macvim")
                set guifont=Menlo\ Regular:h14
            elseif has("gui_win32")
                set guifont=Consolas:h10:cANSI
            endif
        endif
""*  Notes  *"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "git
    "differentiate between modes, change cursor, cursorline, something
    "organize this
    ":options
    " 1 important
    " 2 moving around, searching and patterns
    " 3 tags
    " 4 displaying text
    " 5 syntax, highlighting and spelling
    " 6 multiple windows
    " 7 multiple tab pages
    " 8 terminal
    "11 printing
    "12 messages and info
    "13 selecting text
    "14 editing text
    "15 tabs and indenting
    "16 folding
    "17 diff mode
    "18 mapping
    "19 reading and writing files
    "20 the swap file
    "21 command line editing
    "22 executing external commands
    "23 running make and jumping to errors
    "24 language specific
    "25 multi-byte characters
    "26 various
