local formatting_style = {
	fields = { "abbr", "kind", "menu" },

	format = function(_, item)
		return item
	end,
}

return {
	'hrsh7th/nvim-cmp',
	dependencies = {
		{'hrsh7th/cmp-nvim-lsp'},
		{"L3MON4D3/LuaSnip"},
	},
	config = function()
		local cmp = require('cmp')
		local luasnip = require("luasnip")

		local cmp_select = { behavior=cmp.SelectBehavior.Select}
		local cmp_mappings = cmp.mapping.preset.insert({
			['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
			['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
			['<CR>'] = cmp.mapping.confirm({ select=true }),
		})

		require("luasnip.loaders.from_snipmate").lazy_load({ paths = "./snippets" })

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			formatting = formatting_style,
			window = {
				completion = {
					winhighlight = "Normal:Pmenu,FloatBorder:BorderBG,CursorLine:PmenuSel,Search:None",
				},
				documentation = {
					winhighlight = "Normal:Pmenu,FloatBorder:BorderBG,CursorLine:PmenuSel,Search:None",
				},
			},
			sources = {
				{ name = "nvim_lsp" },
			},
			mapping = cmp_mappings,
		})
	end
}
