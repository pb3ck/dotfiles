-- ~/.config/nvim/init.lua
-- Main entry point for Neovim configuration

-- Set background to dark mode for Modus Vivendi theme
vim.opt.background = "dark"

-- Load core settings
require("core.options")      -- General Neovim options
require("core.autocmds")     -- Autocommands
require("core.keymaps")      -- Keymaps
require("core.lazy")         -- Plugin manager setup

-- The plugin manager will automatically load plugin configurations
-- from the 'plugins' directory
