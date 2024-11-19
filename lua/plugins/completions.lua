return {
	{
		"hrsh7th/cmp-nvim-lsp",
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"L3MON4D3/LuaSnip", -- LuaSnip for snippet expansion
			"saadparwaiz1/cmp_luasnip", -- cmp source for LuaSnip
			"rafamadriz/friendly-snippets", -- A collection of VSCode-like snippets
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			-- Load friendly snippets (VSCode style)
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body) -- Expand snippets
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = "luasnip" }, -- Snippets source
					{ name = "nvim_lsp" }, -- LSP source
				}, {
					{ name = "buffer" }, -- Buffer source (default completion)
				}),
			})
		end,
	},
}
