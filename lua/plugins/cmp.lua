-- Setup nvim-cmp.
local cmp = require'cmp'
vim.api.nvim_command('set completeopt=menuone,noselect')
cmp.setup({
    snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end,
    },
    completion = {
        completeopt = 'menu,menuone,noinsert,noselect',
    },
    formatting = {
      format = function(entry, vim_item)
        local icons = require("lsp.kind").icons
        vim_item.kind = icons[vim_item.kind]
        vim_item.menu = ({
          nvim_lsp = "(LSP)",
          emoji = "(Emoji)",
          path = "(Path)",
          calc = "(Calc)",
          cmp_tabnine = "(Tabnine)",
          vsnip = "(Snippet)",
          luasnip = "(Snippet)",
          buffer = "(Buffer)",
        })[entry.source.name]
        vim_item.dup = ({
          buffer = 1,
          path = 1,
          nvim_lsp = 0,
        })[entry.source.name] or 0
        return vim_item
      end,
    },
    mapping = {
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      -- TODO: potentially fix emmet nonsense
      ["<Tab>"] = cmp.mapping(function()
        if vim.fn.pumvisible() == 1 then
          vim.fn.feedkeys(T "<down>", "n")
        elseif luasnip.expand_or_jumpable() then
          vim.fn.feedkeys(T "<Plug>luasnip-expand-or-jump", "")
        elseif check_backspace() then
          vim.fn.feedkeys(T "<Tab>", "n")
        elseif is_emmet_active() then
          return vim.fn["cmp#complete"]()
        else
          vim.fn.feedkeys(T "<Tab>", "n")
        end
      end, {
        "i",
        "s",
      }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if vim.fn.pumvisible() == 1 then
          vim.fn.feedkeys(T "<up>", "n")
        elseif luasnip.jumpable(-1) then
          vim.fn.feedkeys(T "<Plug>luasnip-jump-prev", "")
        else
          fallback()
        end
      end, {
        "i",
        "s",
      }),

      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.close(),
      ["<CR>"] = cmp.mapping(function(fallback)
        if not require("cmp").confirm(lvim.builtin.cmp.confirm_opts) then
          if luasnip.jumpable() then
            vim.fn.feedkeys(T "<Plug>luasnip-jump-next", "")
          else
            fallback()
          end
        end
      end),
    },
    sources = {
    { name = "nvim_lsp" },
    { name = "path" },
    { name = "luasnip" },
    { name = "cmp_tabnine" },
    { name = "nvim_lua" },
    { name = "buffer" },
    { name = "calc" },
    { name = "emoji" },
    { name = "treesitter" },
    { name = "crates" },
    { name = 'vsnip' },
}
})

-- Setup lspconfig.
require('lspconfig').pyright.setup {
    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
}
