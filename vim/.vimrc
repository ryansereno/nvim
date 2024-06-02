" to symlink from home dir, run: ln -s ~/.config/vim/.vimrc ~/.vimrc   


"=================RYAN SETTINGS=========================
set belloff=all    " Turns off all bell notifications in Vim
set number         " Enables line numbers in the editor
set tabstop=4      " Sets the number of spaces a tab character represents
set shiftwidth=4   " Sets the number of spaces used for each indentation level
set expandtab      " Converts tabs into spaces
set hlsearch       " highlight terms found when searching
set ignorecase     " Makes search case insensitive
set smartcase      " detect whether to make search case sensitive
syntax on          " Enables syntax highlighting in Vim
set termguicolors  " Enables true color support in the terminal (if it supports it)

colorscheme catppuccin_macchiato
set encoding=UTF-8
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['vue'] = 'V'
let NERDTreeShowHidden=1
au! BufNewFile,BufRead *.ejs setf html

let g:netrw_liststyle = 3
let g:netrw_winsize = 25
let g:netrw_preview = 1
"nnoremap <leader>t :w<CR> :Ex <CR> 
"nnoremap <leader>T :w<CR> :Ex <CR> :vertical resize 25<CR>
"
command! Pret :CocCommand prettier.forceFormatDocument
let g:user_emmet_leader_key=','
nnoremap <leader>t :w<CR> :NERDTree<CR>
nnoremap <leader>p :Pret<CR>

"enable select coc autocomplete with enter key
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>" 

"route for fzf executable
set rtp+=/opt/homebrew/opt/fzf 
let $FZF_DEFAULT_COMMAND='rg --files --follow --no-ignore-vcs --hidden -g "!{node_modules/*,.git/*,package-lock.json,package.json}"'

"cntrl-p command for ripgrep/ fzf
nnoremap <C-p> :Rg<cr>

"let g:polyglot_disabled = ['vue'] "to fix performance issues in .vue files

set re=2 "fix typescript file syntax and freezing

"-----------------Code-Execution--------------------------
nnoremap <silent> ,<space> :w<cr>:w !python3 %<cr> 
nnoremap <silent> n<space> :w<cr>:w !node %<cr>
nnoremap <silent> =<space> :w<cr>:w !gcc % && ./a.out<cr>
"-----------------Code-Execution--------------------------

"-------AirlineStatusLine------
let g:airline_theme='catppuccin_mocha'
let g:airline_powerline_fonts = 1
"-------AirlineStatusLine------

"-------RainbowParentheses------
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
"-------RainbowParentheses------
"=================RYAN SETTINGS=========================


"=================PLUG CONFIGURATION====================
call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'mattn/emmet-vim'
Plug 'neoclide/coc.nvim', { 'branch': 'master', 'do': 'yarn install --frozen-lockfile' }
Plug 'ap/vim-css-color'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround'
Plug 'Yggdroot/indentLine'
Plug 'jiangmiao/auto-pairs'
Plug 'uguu-org/vim-matrix-screensaver'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'kien/rainbow_parentheses.vim'
Plug 'sheerun/vim-polyglot'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf.vim'
call plug#end()
"=================PLUG CONFIGURATION====================
