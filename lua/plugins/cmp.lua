-- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup({
snippet = {
expand = function(args)
		-- For `vsnip` user.
		vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` user.

		-- For `luasnip` user.
		-- require('luasnip').lsp_expand(args.body)

		-- For `ultisnips` user.
		-- vim.fn["vsnip#anonymous"](args.body)
end,
},
completion = {
completeopt = 'menu,menuone,noinsert',
},
mapping = {
['<C-d>'] = cmp.mapping.scroll_docs(-4),
['<C-f>'] = cmp.mapping.scroll_docs(4),
['<C-Space>'] = cmp.mapping.complete(),
['<C-e>'] = cmp.mapping.close(),
['<CR>'] = cmp.mapping.confirm({ select = true }),
['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
['<s-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' })
},
sources = {
{ name = 'nvim_lsp' },

-- For vsnip user.
{ name = 'vsnip' },
{ name = 'buffer' },
{ name = 'tags' },
{ name = 'treesitter' }
}
})

-- Setup lspconfig.
require('lspconfig').pyright.setup {
capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
}
