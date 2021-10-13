local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd 'packadd packer.nvim'
end

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
-- Looks
use 'EdenEast/nightfox.nvim'
use 'sainnhe/sonokai'
use 'miyakogi/seiya.vim'

-- Functional
use 'jiangmiao/auto-pairs'
use 'nvim-lua/plenary.nvim'
use 'voldikss/vim-floaterm'
use 'nvim-telescope/telescope.nvim'

-- Autocompletions
use 'neovim/nvim-lspconfig'
use 'hrsh7th/vim-vsnip'
use 'hrsh7th/nvim-compe'
use 'L3MON4D3/LuaSnip'

-- Hybrid
use 'hoob3rt/lualine.nvim'
use 'lewis6991/gitsigns.nvim'

-- Navigation
use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require'nvim-tree'.setup {} end
}
use {
  'romgrk/barbar.nvim',
  requires = {'kyazdani42/nvim-web-devicons'}
}
use 'unblevable/quick-scope'
use 'justinmk/vim-sneak'

end)
