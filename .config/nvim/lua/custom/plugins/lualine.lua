return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local colors = require "monokai-pro.colorscheme"
        vim.opt.cmdheight = 0 -- Minimize command line space
        vim.opt.laststatus = 3 -- Global statusline
        local theme = {
            normal = {
                a = { bg = colors.base.yellow, fg = colors.base.black, gui = "bold" },
                b = { bg = colors.base.background, fg = colors.base.yellow },
                c = { bg = colors.base.background, fg = colors.statusBar.activeForeground },
            },
            insert = {
                a = { bg = colors.base.green, fg = colors.base.black, gui = "bold" },
                b = { bg = colors.base.background, fg = colors.base.green },
                c = { bg = colors.base.background, fg = colors.statusBar.activeForeground },
            },
            visual = {
                a = { bg = colors.base.magenta, fg = colors.base.black, gui = "bold" },
                b = { bg = colors.base.background, fg = colors.base.magenta },
                c = { bg = colors.base.background, fg = colors.statusBar.activeForeground },
            },
            replace = {
                a = { bg = colors.base.red, fg = colors.base.black, gui = "bold" },
                b = { bg = colors.base.background, fg = colors.base.red },
                c = { bg = colors.base.background, fg = colors.statusBar.activeForeground },
            },
            command = {
                a = { bg = colors.base.yellow, fg = colors.base.black, gui = "bold" },
                b = { bg = colors.base.background, fg = colors.base.yellow },
                c = { bg = colors.base.background, fg = colors.statusBar.activeForeground },
            },
            inactive = {
                a = { bg = colors.base.background, fg = colors.base.dimmed1 },
                b = { bg = colors.base.background, fg = colors.base.dimmed1 },
                c = { bg = colors.base.background, fg = colors.base.dimmed1 },
            },
        }

        require("lualine").setup {
            options = {
                theme = theme,
                component_separators = "",
                section_separators = "",
            },
            sections = {
                lualine_a = {
                    {
                        "mode",
                        fmt = function(str)
                            return str:sub(1, 1)
                        end,
                    },
                },
                lualine_b = {
                    {
                        "filename",
                        path = 1,
                        symbols = {
                            modified = "●",
                            readonly = "",
                            unnamed = "",
                        },
                    },
                },
                lualine_c = {
                    {
                        "branch",
                        icon = "󰘬",
                    },
                    { "diff" },
                },
                lualine_x = {
                    {
                        "diagnostics",
                        sections = { "error", "warn", "info", "hint" },
                    },
                },
                lualine_y = { "filetype" },
                lualine_z = { "" },
            },
            -- extensions = {
            --     "lazy",
            --     "mason",
            --     "neo-tree",
            -- },
        }
    end,
}
