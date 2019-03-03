" =========================================================
" Settings
" =========================================================
let mapleader=" "
set clipboard=unnamed,unnamedplus   " Alias unnamed register to the + register, which is the X Window clipboard
set diffopt+=vertical               " Always use vertical diffs
set foldlevelstart=20               " All folds open when opening a file
set foldmethod=indent               " Lines with equal indent form a fold
set ignorecase                      " The case of normal letters is ignored
set mouse=a                         " Enable use of mouse in all modes
set number                          " Show line numbers
set numberwidth=4                   " Minimal number of columns to use for the line number
set relativenumber                  " Show the line number relative to the line with the cursor in front of each line
set smartcase                       " Override the 'ignorecase' option if the search pattern contains upper case characters

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

filetype plugin indent on

" Code folding
" Fold one, Open one, Fold all, Open all, respectively
nnoremap <leader>- zc
nnoremap <leader>= zo
nnoremap <leader>_ zM
nnoremap <leader>+ zR

" Close all tabs and quit
" nnoremap Q :qa<CR>

" Select all
nnoremap <c-a> <esc>gg0vG$

" Open a new empty buffer
nnoremap <leader>n :enew<CR>

" Move to the next buffer
nnoremap <Tab> :bnext<CR>

" Move to the previous buffer
nnoremap <s-Tab> :bprevious<CR>

" Show all open buffers and their status
nnoremap <leader>bl :ls<CR>

" Close current buffer and move to the previous one
nnoremap <c-x> :bp<BAR> bd #<CR>

" Prepare throw away register
nnoremap <leader>x "_

" Finding content in files
nnoremap <c-g> :Rg<CR>

" =========================================================
" Plugings - Make sure you use single quotes
" =========================================================
" Load vim-plug
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

Plug 'rtogo/dracula-vim', { 'as': 'dracula' }
Plug 'haya14busa/incsearch.vim'  
Plug 'junegunn/fzf.vim'
Plug '/usr/bin/fzf'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Plug 'ctrlpvim/ctrlp.vim'

" Initialize plugin system
call plug#end()


" =========================================================
" True Colors
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


" =========================================================
" Color Scheme
" =========================================================
silent! colorscheme dracula
let g:airline_theme='minimalist'


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
let NERDTreeIgnore = ['\.py[cod]', '__pycache__', '.idea', '.egg', '.eggs', '.egg-info', '^.git', '^build$[[dir]]', '^dist$[[dir]]', '^sdist$[[dir]]', '\.ipynb_checkpoints', '^venv$[[dir]]']

" Show hidden files
let NERDTreeShowHidden = 1

" Toggle NerdTree
map <a-1> :NERDTreeToggle<CR>

"Close NerdTree when you open a file
let NERDTreeQuitOnOpen = 1

" Automatically delete the buffer of the file you just deleted with NerdTree
let NERDTreeAutoDeleteBuffer = 1

" Make it prettier
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1


" =========================================================
" Airline
" =========================================================
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Make airline work with the patched fonts
let g:airline_powerline_fonts = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'


" =========================================================
" fzf
" =========================================================
" Open Buffers
nnoremap <leader>; :Buffers<CR>

" Open Files
nnoremap <leader>o :Files<CR>

" Open Tags
nnoremap <leader>t :Tags<CR>


" =========================================================
" Workspace
" =========================================================
nnoremap <leader>s :ToggleWorkspace<CR>

