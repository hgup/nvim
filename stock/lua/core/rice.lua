local colorscheme = 'sonokai'

if vim.fn.has('gui_running') == 0 then
    vim.opt.t_co = 256
end
if vim.fn.has('nvim') == 1 then
    vim.api.nvim_command('let $NVIM_TUI_ENABLE_TRUE_COLOR=1')
end
if vim.fn.has('termguicolors') == 1 then
    vim.opt.termguicolors = true
end

vim.opt.background = 'dark'
vim.api.nvim_command('colorscheme '..colorscheme)


vim.opt.guifont = 'JetBrainsMono\ NF:h14'

vim.cmd[[

" Temperory till, neovide resolves the blur issues
let g:neovide_window_floating_opacity = 0
let g:neovide_floating_blur = 0
let g:neovide_floating_opacity = 0.9

]]
