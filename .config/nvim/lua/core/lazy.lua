-- ~/.config/nvim/lua/core/lazy.lua
-- Plugin manager setup

-- Bootstrap lazy.nvim if not installed
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

-- Configure and initialize lazy.nvim
require("lazy").setup({
  -- Import all plugins from the plugins directory
  -- Each file in that directory is a module that returns a plugin spec or a list of plugin specs
  { import = "plugins" },
}, {
  -- Lazy.nvim configuration
  install = {
    colorscheme = { "tokyonight-moon" },
  },
  ui = {
    border = "rounded",
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
  change_detection = {
    notify = false,
  },
})
