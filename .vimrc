" Minimal .vimrc
set nocompatible           " so you get more than vi
set ai                     " Auto indent
set cindent                " C-style indent
set bs=2                   " Backspace over linebreak
set ts=4                   " Tabstop (usually equal to sw)
set sw=4                   " Shiftwidth
"let loaded_matchparen = 1  " Do not match parenthesis that slows you down (in 7.0)
set completeopt=           " No list for completion (^P and ^N) (in 7.0)
set ruler                  " ruler (optional)
set nu                     " line numbering (optional)
set hlsearch
" Simply type ":mak" to make your code (optional)
au FileType cpp,c setl mp=make\ %:t:r
" (works better if you also set $CFLAGS and $CXXFLAGS in bash)
color evening

set expandtab
set showmatch

set pastetoggle=<F10>
set clipboard=unnamed

let mapleader=","       " leader is comma
inoremap jk <esc>

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

autocmd BufRead,BufNewFile *.html setlocal spell spelllang=en_us

filetype off
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'nvie/vim-flake8'
    autocmd BufWritePost *.py call Flake8()
    function NoShow()
        let g:flake8_show_quickfix=0
        wq
    endfunction
    autocmd FileType python cnoreabbrev <expr> wq getcmdtype() == ":" && getcmdline() == 'wq' ? 'call NoShow()' : 'wq'
    autocmd FileType python cnoreabbrev <expr> q winnr("$") > 1 && getcmdtype() == ":" && getcmdline() == 'q' ? 'ccl <BAR> q' : 'q'
    autocmd FileType python cnoreabbrev <expr> x winnr("$") > 1 && getcmdtype() == ":" && getcmdline() == 'x' ? 'ccl <BAR> x' : 'x'

Plugin 'Valloric/YouCompleteMe'
    let g:ycm_autoclose_preview_window_after_completion=1
    map <C-g>  :YcmCompleter GoToDefinitionElseDeclaration<CR>
    map <C-b>  <C-o>

Plugin 'hynek/vim-python-pep8-indent'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
    set laststatus=2
    set t_Co=16
    hi Normal ctermfg=white ctermbg=black
    hi Visual ctermfg=black ctermbg=white
    let g:airline_theme='base16color'

Plugin 'scrooloose/nerdtree'
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
    map <Tab> :NERDTreeToggle<CR>
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    let NERDTreeIgnore = ['\.pyc$']


Plugin 'jason0x43/vim-js-indent'

Plugin 'editorconfig/editorconfig-vim'

Plugin 'kien/ctrlp.vim'
    let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
    let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
      \ -g ""'
    let g:ctrlp_match_window = 'bottom,order:ttb'
    let g:ctrlp_switch_buffer = 0
    let g:ctrlp_working_path_mode = 0

Plugin 'scrooloose/syntastic'

Plugin 'sjl/gundo.vim'
    nnoremap <F5> :GundoToggle<CR>
    let g:gundo_width = 55
    let g:gundo_preview_height = 25

Plugin 'tpope/vim-surround'

Plugin 'nathanaelkane/vim-indent-guides'

Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-misc'

Plugin 'majutsushi/tagbar'
    nnoremap <F8> :TagbarToggle<CR>

call vundle#end()

filetype plugin indent on

highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
