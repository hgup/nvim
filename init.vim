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
Plug 'nvim-telescope/telescope.nvim'

"Autocompletions
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

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
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <leader>vs :vsplit<cr>

" clear highlight
nnoremap <leader>m :noh<return>
nno <BS> :set hls!\|set hls?<CR>

" init.vim quick edits
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" show colors
nnoremap <leader>c :so $VIMRUNTIME/syntax/hitest.vim<return>

" toggle wrap
nnoremap <buffer><localleader>w :set wrap!<cr>

" buffer settings
nnoremap <s-tab> :bp<return>
nnoremap <tab> :bn<return>
nnoremap <silent><leader>d :bp\|bd #\|BarbarEnable<return>

" save remaps
nnoremap <leader>W :w !diff % -<cr>
nnoremap <leader>w :w<cr>

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
set whichwrap+=<,h "Cool cursor nextline wrapping settings
set whichwrap+=>,l
set showcmd
set noswapfile " doesn't create swap files
set noshowmode
set shortmess+=c
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

"set lazyredraw "redraws the screne when it needs to
set showmatch "highlights matching brackets
set incsearch "search as characters are entered
set nohlsearch "remove highlight

" run code
augroup compileandrun
    autocmd!
    autocmd filetype python nnoremap <f5> :w <bar> :!python3 % <cr>
	autocmd filetype cpp nnoremap <silent> <f3> :!g++ -O0 -fsyntax-only %<cr>
	autocmd filetype cpp nnoremap <silent> <f4> :!start cmd /c a.exe ^& pause<cr><cr>
	autocmd filetype cpp nnoremap <silent> <f5> :!g++ -O2 %<cr> :!start cmd /c a.exe ^& pause<cr><cr>
    autocmd filetype java nnoremap <f5> :w <bar> !javac % && java %:r <cr>
augroup END

"custom
autocmd BufEnter * silent! lcd %:p:h


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
if has("unix")
    function! FontSizePlus ()
      let l:gf_size_whole = matchstr(&guifont, '\( \)\@<=\d\+$')
      let l:gf_size_whole = l:gf_size_whole + 1
      let l:new_font_size = ' '.l:gf_size_whole
      let &guifont = substitute(&guifont, ' \d\+$', l:new_font_size, '')
    endfunction

    function! FontSizeMinus ()
      let l:gf_size_whole = matchstr(&guifont, '\( \)\@<=\d\+$')
      let l:gf_size_whole = l:gf_size_whole - 1
      let l:new_font_size = ' '.l:gf_size_whole
      let &guifont = substitute(&guifont, ' \d\+$', l:new_font_size, '')
    endfunction
else
    function! FontSizePlus ()
      let l:gf_size_whole = matchstr(&guifont, '\(:h\)\@<=\d\+$')
      let l:gf_size_whole = l:gf_size_whole + 1
      let l:new_font_size = ':h'.l:gf_size_whole
      let &guifont = substitute(&guifont, ':h\d\+$', l:new_font_size, '')
    endfunction

    function! FontSizeMinus ()
      let l:gf_size_whole = matchstr(&guifont, '\(:h\)\@<=\d\+$')
      let l:gf_size_whole = l:gf_size_whole - 1
      let l:new_font_size = ':h'.l:gf_size_whole
      let &guifont = substitute(&guifont, ':h\d\+$', l:new_font_size, '')
    endfunction
endif


nmap <F12> :call FontSizeMinus()<CR>
nmap <S-F12> :call FontSizePlus()<CR>
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
" Temperory till, neovide resolves the blur issues
let g:neovide_window_floating_opacity = 0
let g:neovide_floating_blur = 0
let g:neovide_floating_opacity = 0.9

" PLUGIN SETTINGS


" --- LOOKS ---
" NO-config: <colorscheme>, nvim-web-devicons

if has("unix")
" TREESITTER
lua <<EOF
require'nvim-treesitter.configs'.setup {
		ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
		ignore_install = {}, -- List of parsers to ignore installing
		indent = {
				enable = true
				},
		highlight = {
				enable = true,              -- false will disable the whole extension
				disable = {},  -- list of language that will be disabled
				-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
				-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
				-- Using this option may slow down your editor, and you may see some duplicate highlights.
				-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = true,
  },
}
EOF
endif
" --- FUNCTIONAL ---

" NO-config: auto-pairs, plenary

"VIM-FLOATERM
let g:floaterm_keymap_toggle = '<F1>'


" TELESCOPE
nnoremap <silent><C-P> :Telescope find_files<cr>

"
" --- HYBRID ---

" LUALINE
lua require('custom.lualine')

" GITSIGNS
lua require('gitsigns').setup()
nnoremap <silent><leader>gn :Gitsigns next_hunk<cr>zzzv
nnoremap <silent><leader>gp :Gitsigns prev_hunk<cr>zzzv
nnoremap <silent><leader>gg :Gitsigns preview_hunk<cr>
nnoremap <leader>gs :Gitsigns stage_hunk<cr>
nnoremap <leader>gc :!git commit -m "

" -- AUTOCOMPLETIONS --

" LSP
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
"nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <A-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <A-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

" CMP
lua require('plugins.cmp')
autocmd FileType TelescopePrompt lua require('cmp').setup.buffer { enabled = false }

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
let bufferline = get(g:, 'bufferline', {})
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
nnoremap <silent><leader>f :call ToggleNvimTree()<cr>
let bufferline.auto_hide = v:true
let bufferline.animation = v:true
let bufferline.no_name_title = "untitled"

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
