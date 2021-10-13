local map = vim.api.nvim_set_keymap
-- leaders
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

-- split navigations
map('n',  '<C-J>',  '<C-W><C-J>',   {nnoremap = true})
map('n',  '<C-K>',  '<C-W><C-K>',   {nnoremap = true})
map('n',  '<C-L>',  '<C-W><C-L>',   {nnoremap = true})
map('n',  '<C-H>',  '<C-W><C-H>',   {nnoremap = true})
map('n','<leader>vs', ':vsplit<cr>',{nnoremap = true})

-- clear highlights
map('n',  '<leader>m', ':noh',      {nnoremap = true})
map('n',  '<BS>',':set hls!\\|set hls?<CR>')

-- init.lua quick edits
map('n','<leader>ev', ':vsplit $MYVIMRC<cr>',{nnoremap = true})
map('n','<leader>sv', ':vsplit $MYVIMRC<cr>',{nnoremap = true})

-- show colors
map('n','<leader>c', ':so $VIMRUNTIME/syntax/hitest.vim<return>',{nnoremap = true})

-- toggle wrap
map('n','<buffer><localleader>w',':set wrap!<cr>',{nnoremap = true})

-- buffer settings
map('n','<s-tab>',':bp<return>', {nnoremap = true})
map('n','<tab>',':bn<return>', {nnoremap = true})
map('n','<silent><leader>d',':bp\|bd #\|BarbarEnable<return>', {nnoremap = true})

-- save remaps
map('n','<leader>w',':w<cr>', {nnoremap = true})
map('n','<leader>W',':w !diff % -<cr>', {nnoremap = true})

-- primeagen remaps
map('n','Y','y$', {nnoremap = true})
map('n','n','nzzzv', {nnoremap = true})
map('n','N','Nzzzv', {nnoremap = true})
map('n','J','mzJz`v', {nnoremap = true})

-- GUI rempas
map('n','<F12>',':call FontSizeMinus()<CR>')
map('n','<S-F12>',':call FontSizePlus()<CR>')
map('n','<F11>',':call Neovide_fullcreen()<CR>')

-- nvim tree remaps
map('n','<silent><leader>f',':call ToggleNvimTree()<CR>', {nnoremap = true})

-- sneak remaps
vim.cmd[[

map gS <Plug>Sneak_,
map gs <Plug>Sneak_;

]]
