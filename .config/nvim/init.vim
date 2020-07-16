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
set hidden                          " Allows to edit multiple buffers without saving the modifications made to a buffer while loading other buffers
set timeoutlen=2000                 " How long vim will wait for another key press after the leader key is pressed

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

filetype plugin indent on

" Open config file
nnoremap <Leader>fd :e ~/.config/nvim/init.vim<CR>

" Reload config file
nnoremap <Leader>fR :source ~/.config/nvim/init.vim<CR>:nohl<CR>

" Save buffer
nnoremap <Leader>fs :w<CR>

" Copy buffer filename
nnoremap <Leader>fy :let @+=expand("%:p")<CR>

" Rename current buffer file
" nnoremap <Leader>fR

" Delete current buffer file
" nnoremap <Leader>fD

" Close buffer
nnoremap <c-w> :bd<CR>
nnoremap <Leader>bd :bd<CR>

" Show all open buffers and their status
" Enter / Ctrl-X / Ctrl-V to open in
" current window / horizontal split / vertical split
nnoremap <Leader>bb :Buffers<CR>

" Open a new empty buffer
nnoremap <Leader>bN :enew<CR>

" Copy buffer to clipboard
nnoremap <Leader>bY gg"+yG``zz

" Files in project
" - Enter / Ctrl-X / Ctrl-V to open in
"   current window / horizontal split / vertical split
" - Press Tab to select multiple files
nnoremap <Leader>ph :Files<CR>

" Open history
" - Enter / Ctrl-X / Ctrl-V to open in
"   current window / horizontal split / vertical split
" - Press Tab to select multiple files
nnoremap <Leader>bh :History<CR>

" Search content in project files
" Enter / Ctrl-X / Ctrl-V to open in
" current window / horizontal split / vertical split
nnoremap <Leader>sp :RG<CR>

" Replace in project
" nnoremap <Leader>pR

" Close all buffers
nnoremap <Leader>pk :1,$bd<CR>

" Resume search
" nnoremap <Leader>rl

" Split window right
nnoremap <Leader>w/ <c-w>v

" Split window horizontally
nnoremap <Leader>w- <c-w>s

" Close window
nnoremap <Leader>wd :q<CR>

" Close all windows except the active one
nnoremap <Leader>w1 :only<CR>

" Go one window left
nnoremap <Leader>wh <c-w>h

" Go one window right
nnoremap <Leader>wl <c-w>l

" Go one window up
nnoremap <Leader>wk <c-w>k

" Go one window down
nnoremap <Leader>wj <c-w>j

" Move window to far right
nnoremap <Leader>wL <c-w>L

" Move window to far left
nnoremap <Leader>wH <c-w>H

" Move window to very top
nnoremap <Leader>wK <c-w>K

" Move window to very bottom
nnoremap <Leader>wJ <c-w>J

" Code folding
" Fold one, Open one, Fold all, Open all, respectively
nnoremap <Leader>- zc
nnoremap <Leader>= zo
nnoremap <Leader>_ zM
nnoremap <Leader>+ zR

" Select all
nnoremap <c-a> gg0vG$

" Move to the next buffer
nnoremap <Tab> :bnext<CR>

" Move to the previous buffer
nnoremap <s-Tab> :bprevious<CR>

" Prepare throw away register
nnoremap <Leader>x "_

" Automatically append closing characters
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}
inoremap        (  ()<Left>
inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
inoremap <expr> ' strpart(getline('.'), col('.')-1, 1) == "\'" ? "\<Right>" : "\'\'\<Left>"
inoremap <expr> " strpart(getline('.'), col('.')-1, 1) == "\"" ? "\<Right>" : "\"\"\<Left>"

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
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'jreybert/vimagit'
Plug 'ap/vim-css-color'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf.vim'

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
nnoremap <Leader>ft :NERDTreeToggle<CR>

" Show current file in NerdTree
" nnoremap <Leader>fT

"Close NerdTree when you open a file
let NERDTreeQuitOnOpen = 1

" Automatically delete the buffer of the file you just deleted with NerdTree
let NERDTreeAutoDeleteBuffer = 1

" Make it prettier
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" =========================================================
" Lightline
" =========================================================
let g:lightline = {
      \ 'colorscheme': 'one',
      \ }

" =========================================================
" FZF
" =========================================================
let g:fzf_layout = { 'down': '40%' }
let $FZF_DEFAULT_COMMAND = 'rg --files'

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

