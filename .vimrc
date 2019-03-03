" Load vim-plug
if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" =========================================================
" Plugings - Make sure you use single quotes
" =========================================================
Plug 'rtogo/dracula-vim', { 'as': 'dracula' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'haya14busa/incsearch.vim'  
Plug 'scrooloose/nerdtree'

" Initialize plugin system
call plug#end()

" =========================================================
" onedark
" =========================================================
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

syntax on
silent! colorscheme dracula

" =========================================================
" Settings
" =========================================================
let mapleader=" "
set backspace=2                     " Backspace deletes like most programs in insert mode
set clipboard=unnamed,unnamedplus   " Alias unnamed register to the + register, which is the X Window clipboard
set diffopt+=vertical               " Always use vertical diffs
set foldlevelstart=20               " All folds open when opening a file
set foldmethod=indent               " Lines with equal indent form a fold
set ignorecase                      " The case of normal letters is ignored
set mouse=a                         " Enable use of mouse in all modes
set number                          " Show line numbers
set numberwidth=5                   " Minimal number of columns to use for the line number
set relativenumber                  " Show the line number relative to the line with the cursor in front of each line
set ruler                           " Show the cursor position all the time
set showcmd                         " Display incomplete commands
set smartcase                       " Override the 'ignorecase' option if the search pattern contains upper case characters

" Soft tabs, 4 spaces
set tabstop=4                       " Number of spaces that a <Tab> in the file counts for
set shiftwidth=4                    " Number of spaces to use for each step of (auto)indent
set shiftround                      " Round indent to multiple of 'shiftwidth'
set expandtab                       " Use the appropriate number of spaces to insert a <Tab>.

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright


filetype plugin indent on

" Code folding
nnoremap <leader>= zo
nnoremap <leader>- zc
nnoremap <leader>+ zR
nnoremap <leader>_ zM

" Close all tabs and quit
nnoremap Q :qa<CR>

" Close file
nnoremap <c-w> :q<CR>

" Select all
nnoremap <c-a> <esc>gg0vG$

" =========================================================
" ctrlp
" =========================================================
let g:ctrlp_regexp = 1

" =========================================================
" incsearch
" =========================================================
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map / <Plug>(incsearch-forward)
map n <Plug>(incsearch-nohl-n)
map N <Plug>(incsearch-nohl-N)

" =========================================================
" NERDTree
" =========================================================
" Don't show theses
let NERDTreeIgnore = ['\.py[cod]', '__pycache__', '.idea', '.egg', '.eggs', '.egg-info', '^build$[[dir]]', '^dist$[[dir]]', '^sdist$[[dir]]', '\.ipynb_checkpoints', '^venv$[[dir]]']

" Toggle NertTree
map <c-b> :NERDTreeToggle<CR>

