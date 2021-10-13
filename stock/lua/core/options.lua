-- natural splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- folding
vim.opt.foldmethod = 'indent'
vim.opt.foldlevel = 99

-- core
vim.api.nvim_command('filetype plugin on')
vim.opt.tabstop = 8
vim.opt.softtabstop = 0
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.encoding = 'utf-8'
vim.api.nvim_command('syntax on')
vim.opt.nu = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.ruler = true
vim.opt.nowrap = true
vim.opt.whichwrap = vim.opt.whichwrap + '<,h'
vim.opt.whichwrap = vim.opt.whichwrap + '>,l'
vim.opt.showcmd = true
vim.opt.noswapfile = true
vim.opt.shortmess = vim.opt.shortmess + 'c'
vim.opt.shell = 'cmd'
vim.opt.hidden = true
vim.api.nvim_command('set formatoptions-=o')

-- indentation and mouse
vim.opt.backspace = 'indent,eol,start'
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.pastetoggle = '<F1>'
vim.opt.mouse = vim.opt.mouse + 'a'

-- Searching
vim.opt.smartcase = true 
vim.opt.ignorecase = true
vim.opt.showmatch = true
vim.opt.incsearch = true
vim.opt.nohlsearch = true

