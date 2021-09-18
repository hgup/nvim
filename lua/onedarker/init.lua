vim.api.nvim_command "hi clear"
if vim.fn.exists "syntax_on" then
  vim.api.nvim_command "syntax reset"
end
vim.o.background = "dark"
vim.o.termguicolors = true
vim.g.colors_name = "onedarker"

local util = require "onedarker.util"
Config = require "onedarker.config"
C = require "onedarker.palette"
local highlights = require "onedarker.highlights"
local Treesitter = require "onedarker.Treesitter"
local markdown = require "onedarker.markdown"
local Whichkey = require "onedarker.Whichkey"
local Git = require "onedarker.Git"
local LSP = require "onedarker.LSP"

local skeletons = {
  highlights,
  Treesitter,
  markdown,
  Whichkey,
  Git,
  LSP,
}

for _, skeleton in ipairs(skeletons) do
  util.initialise(skeleton)
end
