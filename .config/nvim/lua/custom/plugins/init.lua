--[[

    PLUGINS

--]]

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system { "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath }
    if vim.v.shell_error ~= 0 then
        error("Error cloning lazy.nvim:\n" .. out)
    end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require("lazy").setup({

    require "custom.plugins.cmp",
    require "custom.plugins.dap",
    require "custom.plugins.mini",
    require "custom.plugins.theme",
    require "custom.plugins.conform",
    require "custom.plugins.harpoon",
    require "custom.plugins.lualine",
    require "custom.plugins.devicons",
    require "custom.plugins.neo-tree",
    require "custom.plugins.dashboard",
    require "custom.plugins.telescope",
    require "custom.plugins.which_key",
    require "custom.plugins.treesitter",
    require "custom.plugins.lsp.config",
    require "custom.plugins.lsp.plugins",
    require "custom.plugins.tmux-status",
    require "custom.plugins.vim-tmux-navigator",

    require "custom.plugins.misc",
    --
    -- The following two comments only work if you have downloaded the kickstart repo, not just copy pasted the
    -- init.lua. If you want these files, they are in the repository, so you can just download them and
    -- place them in the correct locations.

    -- NOTE: Next step on your Neovim journey: Add/Configure additional plugins for Kickstart
    --
    --  Here are some example plugins that I've included in the Kickstart repository.
    --  Uncomment any of the lines below to enable them (you will need to restart nvim).

    require "kickstart.plugins.indent_line",
    require "kickstart.plugins.autopairs",
    require "kickstart.plugins.gitsigns", -- adds gitsigns recommend keymaps
}, {
    ui = {
        -- If you are using a Nerd Font: set icons to an empty table which will use the
        -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
        icons = vim.g.have_nerd_font and {} or {
            runtime = "💻",
            require = "🌙",
            config = "🛠",
            plugin = "🔌",
            source = "📄",
            event = "📅",
            lazy = "💤 ",
            start = "🚀",
            keys = "🗝",
            task = "📌",
            init = "⚙",
            cmd = "⌘",
            ft = "📂",
        },
    },
})
