local function on_attach(bufnr)
	local api = require("nvim-tree.api")

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	api.config.mappings.default_on_attach(bufnr)

	vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close Directory'))
	vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))

	--vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent,        opts('Up'))
	--vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
end

require("nvim-tree").setup {
	on_attach = on_attach,
	git = {
		enable = false,
	},
	filters = {
		dotfiles = false,
	},
}
