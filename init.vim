" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" PLUGINS 
" ~/.config/nvim/plugged (UNIX)
" /user/<username>/appdata/local/nvim/plugged (WINDOWS)
call plug#begin(stdpath('config').'/plugged')

"Looks
Plug 'navarasu/onedark.nvim'
Plug 'kyazdani42/nvim-web-devicons'

"Functional
Plug 'jiangmiao/auto-pairs'
Plug 'nvim-lua/plenary.nvim'
Plug 'voldikss/vim-floaterm'

"Hybrid
Plug 'hoob3rt/lualine.nvim'
Plug 'lewis6991/gitsigns.nvim'

"Navigation
Plug 'kyazdani42/nvim-tree.lua'
Plug 'romgrk/barbar.nvim'
Plug 'unblevable/quick-scope'
Plug 'justinmk/vim-sneak'

call plug#end()

" KEYBINDINGS

" leaders
let g:mapleader = " "
let g:maplocalleader = ','

"split navigations
nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <C-W><C-K>
nnoremap <leader>l <C-W><C-L>
nnoremap <leader>h <C-W><C-H>

" clear highlight
nnoremap <leader>m :noh<return>
nno <BS> :set hls!\|set hls?<CR>

" moves current line down or up
nnoremap <leader>- ddp
nnoremap <leader>_ ddkP

" init.vim quick edits
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" show colors
nnoremap <leader>c :so $VIMRUNTIME/syntax/hitest.vim<return>

" toggle wrap
nnoremap <buffer><localleader>w :set wrap!<cr>

" switch buffer
nnoremap <s-tab> :bp<return>
nnoremap <tab> :bn<return>

" primeagen remaps
nnoremap Y y$
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJz`v

" STANDARD SETTINGS

" natural split settings
set splitbelow
set splitright

" Enable folding
set foldmethod=indent
set foldlevel=99

" Code Editor settings
au BufNewFile,BufRead *.py,*.java,*.cpp,*.c,*.cs,*.rkt,*.h,*.html
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=120 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

" Core settings
filetype plugin on
set tabstop=4
set encoding=utf-8
syntax on
set nu 
set clipboard=unnamedplus " public copy/paste register
set ruler
set nowrap
set showcmd
set noswapfile " doesn't create swap files
set noshowmode
set shortmess+=c
set omnifunc=syntaxcomplete#Complete
set shell=cmd
set hidden

" Indentation and mouse
set backspace=indent,eol,start " let backspace delete over lines
set autoindent
set smartindent " allow vim to best-effort guess the indentation
set pastetoggle=<F1> " enable paste mode
set mouse+=a

" Searching
set smartcase
set ignorecase
set wildmenu "graphical auto complete menu
set lazyredraw "redraws the screne when it needs to
set showmatch "highlights matching brackets
set incsearch "search as characters are entered
set hlsearch "highlights matching searches

" run code
augroup compileandrun
    autocmd!
    autocmd filetype python nnoremap <f5> :w <bar> :!python3 % <cr>
    autocmd filetype cpp nnoremap <f2> :w <bar> !g++ -std=c++17 % <cr>
    autocmd filetype cpp nnoremap <f3> :vnew <bar> :te "a.exe" <cr>
    autocmd filetype cpp nnoremap <f4> :w <bar> !g++ -std=c++17 % <cr> :vnew <bar> :te "a.exe" <cr>
    autocmd filetype c nnoremap <f5> :w <bar> !make %:r && ./%:r <cr>
    autocmd filetype java nnoremap <f5> :w <bar> !javac % && java %:r <cr>
augroup END

" RICING

" true colours
if !has('gui_running')
  set t_Co=256
endif
if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
  set termguicolors
endif

" colorscheme
set background=dark
colorscheme onedarker


" GUI SETTINGS

" standard
set guifont=JetBrainsMono\ NF:h14
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L

" neovide specific
function Neovide_fullscreen()
    if g:neovide_fullscreen == v:true
        let g:neovide_fullscreen=v:false
    else
        let g:neovide_fullscreen=v:true
    endif
endfunction
map <F11> :call Neovide_fullscreen()<cr>

" PLUGIN SETTINGS


" --- LOOKS ---
" NO-config: <colorscheme>, nvim-web-devicons


" --- FUNCTIONAL ---

" NO-config: auto-pairs, plenary

"VIM-FLOATERM
let g:floaterm_keymap_toggle = '<F1>'


" --- HYBRID ---

" LUALINE
lua require('custom.lualine')

" GITSIGNS
lua require('gitsigns').setup()


" --- NAVIGATION ---

" NVIM TREE
" lua settings
lua <<EOF
	   local tree_cb = require'nvim-tree.config'.nvim_tree_callback
	   vim.g.nvim_tree_bindings = {
	   { key = {"<CR>", "l", "<2-LeftMouse>"}, cb = tree_cb("edit") },
	   { key = "h",                         cb = tree_cb("close_node") },
}
EOF

" global
let g:nvim_tree_auto_close = 1
let g:nvim_tree_hijack_cursor = 1
let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache' ] "empty by default
let g:nvim_tree_follow_update_path = 1 
let g:nvim_tree_follow = 1
" cursorline
autocmd! BufEnter * call ToggleCursorLine()
function! ToggleCursorLine()
    if (bufname("%") =~ "NvimTree")
        setlocal cursorline
    else
        setlocal nocursorline
    endif
endfunction
 
" BARBAR 
" (compatibility with NVIM-TREE)
let s:treeEnabled=0
function! ToggleNvimTree()
	   if s:treeEnabled
			 lua require('custom.tree').close()
			 let s:treeEnabled = 0
	   else
			 lua require('custom.tree').open()
			 let s:treeEnabled = 1
	   endif
endfunction
nnoremap <leader>f :call ToggleNvimTree()<cr>

" QUICK SCOPE
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" SNEAK 
" global
let g:sneak#prompt = '  '
let g:sneak#s_next = 1
let g:sneak#use_ic_scs = 1
let g:sneak#label = 1
" highlights
highlight Sneak guifg=white guibg=#708be6 ctermfg=black ctermbg=red gui=none
highlight SneakScope guifg=black guibg=#49A3ff ctermfg=red ctermbg=yellow gui=italic
" remap plugs for 
map gS <Plug>Sneak_,
map gs <Plug>Sneak_;
