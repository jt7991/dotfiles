vim.opt.termguicolors = true

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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
vim.opt.number = true
vim.opt.relativenumber = true
require("lazy").setup({
	{
		"folke/tokyonight.nvim",
		priority = 1000,
		opts = {
			transparent = false,
			style = "moon",
		},
		config = function(_, opts)
			require("tokyonight").setup(opts)
			vim.cmd.colorscheme("tokyonight")
			vim.api.nvim_set_hl(0, "DiagnosticUnnecessary", {
				fg = "#5e6080",
			})
			vim.api.nvim_set_hl(0, "CursorLineNr", {
				fg = "#ffff00",
			})
		end,
	},
})
