return { -- You can easily change to a different colorscheme.
	-- Change the name of the colorscheme plugin below, and then
	-- change the command in the config to whatever the name of that colorscheme is.
	--
	-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
	"loctvl842/monokai-pro.nvim",
	priority = 1000,
	config = function()
		require("monokai-pro").setup({
			transparent_background = false,
			terminal_colors = true,
			devicons = true, -- highlight the icons of `nvim-web-devicons`
			styles = {
				comment = { italic = false },
				keyword = { italic = false }, -- any other keyword
				type = { italic = false }, -- (preferred) int, long, char, etc
				storageclass = { italic = false }, -- static, register, volatile, etc
				structure = { italic = false }, -- struct, union, enum, etc
				parameter = { italic = false }, -- parameter pass in function
				annotation = { italic = false },
				tag_attribute = { italic = false }, -- attribute of tag in reactjs
			},
			filter = "machine", -- classic | octagon | pro | machine | ristretto | spectrum
			-- Enable this will disable filter option
			day_night = {
				enable = false, -- turn off by default
				day_filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
				night_filter = "spectrum", -- classic | octagon | pro | machine | ristretto | spectrum
			},
			inc_search = "background", -- underline | background
			background_clear = {
				-- "float_win",
				"toggleterm",
				"telescope",
				-- "which-key",
				"renamer",
				"notify",
				-- "nvim-tree",
				"neo-tree",
				-- "bufferline", -- better used if background of `neo-tree` or `nvim-tree` is cleared
			},
			plugins = {
				bufferline = {
					underline_selected = false,
					underline_visible = true,
				},
				indent_blankline = {
					context_highlight = "pro", -- default | pro
					context_start_underline = false,
				},
			},
			-- ---@param c Colorscheme
			-- override = function(c) end,
			-- ---@param cs Colorscheme
			-- ---@param p ColorschemeOptions
			-- ---@param Config MonokaiProOptions
			-- ---@param hp Helper
			-- override = function(cs: Colorscheme, p: ColorschemeOptions, Config: MonokaiProOptions, hp: Helper) end,
		})
	end,
	init = function()
		vim.cmd.colorscheme("monokai-pro")

		-- You can configure highlights by doing something like:
		vim.cmd.hi("Comment gui=none")
	end,
}
