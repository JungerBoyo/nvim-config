local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
      "nvim-tree/nvim-tree.lua",
      version = "*",
      lazy = false,
      dependencies = {
        "nvim-tree/nvim-web-devicons",
      }
    },
    "folke/tokyonight.nvim",
    "williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
	-- Vscode-like pictograms
	{
		"onsails/lspkind.nvim",
		event = { "VimEnter" },
	},
    -- Auto-completion engine
	{
		"hrsh7th/nvim-cmp",
		dependencies = { "lspkind.nvim" },
		config = function()
			require("config.nvim-cmp")
		end,
	},
	{ "hrsh7th/cmp-nvim-lsp", dependencies = { "nvim-cmp" } },
	{ "hrsh7th/cmp-buffer", dependencies = { "nvim-cmp" } }, -- buffer auto-completion
	{ "hrsh7th/cmp-path", dependencies = { "nvim-cmp" } }, -- path auto-completion
	{ "hrsh7th/cmp-cmdline", dependencies = { "nvim-cmp" } }, -- cmdline auto-completion
	-- Code snippet engine
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
	},
    -- nvim dap
    {
        "mfussenegger/nvim-dap",
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
    },
	-- cmake tools
    {
        "nvim-lua/plenary.nvim",
    },
	{ 
		'Civitasv/cmake-tools.nvim',
	},
	-- comments
	{
		'numToStr/Comment.nvim',
		opts = {
			-- add any options here
		}
	},
	{ "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} },
	-- cortex-m debugging
	{
		'jedrzejboczar/nvim-dap-cortex-debug',
		dependencies = { 'nvim-dap', "rcarriga/nvim-dap-ui" }
	},
	{ "kevinhwang91/rnvimr" },
	{
		"lervag/vimtex",
		lazy = false,     -- we don't want to lazy load VimTeX
		-- tag = "v2.15", -- uncomment to pin to a specific release
		init = function()
			-- VimTeX configuration goes here, e.g.
			vim.g.vimtex_view_method = "zathura"
  		end
	},
	{ "micangl/cmp-vimtex" },
	{
	  "dhananjaylatkar/cscope_maps.nvim",
	  dependencies = {
		"folke/which-key.nvim", -- optional [for whichkey hints]
		"nvim-telescope/telescope.nvim", -- optional [for picker="telescope"]
		"ibhagwan/fzf-lua", -- optional [for picker="fzf-lua"]
		"echasnovski/mini.pick", -- optional [for picker="mini-pick"]
		"nvim-tree/nvim-web-devicons", -- optional [for devicons in telescope, fzf or mini.pick]
	  },
	  opts = {
		-- USE EMPTY FOR DEFAULT OPTIONS
		-- DEFAULTS ARE LISTED BELOW
	  },
}
})

require("mason").setup()
require("mason-nvim-dap").setup({ ensure_installed = { "python", "codelldb" } })
require("cmake-tools").setup({})
require('Comment').setup()
--require("cmp-vimtex").setup()
