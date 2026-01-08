-- ~/.config/nvim/lua/core/options.lua
-- Core Neovim options and settings

-- Global leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- General settings
local opt = vim.opt

-- UI related
opt.number = true                   -- Show line numbers
opt.relativenumber = true           -- Show relative line numbers
opt.cursorline = true               -- Highlight current line
opt.showmode = false                -- Don't show mode (use statusline instead)
opt.signcolumn = "yes"              -- Always show sign column
opt.termguicolors = true            -- True color support
opt.scrolloff = 8                   -- Keep 8 lines above/below cursor
opt.sidescrolloff = 8               -- Keep 8 columns left/right of cursor
opt.showmatch = true                -- Highlight matching brackets
opt.list = true                     -- Show some invisible characters
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Window splitting
opt.splitbelow = true               -- Horizontal splits open below
opt.splitright = true               -- Vertical splits open right

-- Search behavior
opt.ignorecase = true               -- Ignore case in search
opt.smartcase = true                -- Override ignorecase if search has uppercase
opt.hlsearch = true                 -- Highlight search results
opt.incsearch = true                -- Incremental search

-- Indentation
opt.expandtab = true                -- Use spaces instead of tabs
opt.tabstop = 2                     -- Number of spaces a tab counts for
opt.softtabstop = 2                 -- Number of spaces a tab counts for in edit ops
opt.shiftwidth = 2                  -- Number of spaces for indentation
opt.smartindent = true              -- Insert indents automatically

-- Behavior
opt.mouse = "a"                     -- Enable mouse in all modes
opt.clipboard = "unnamedplus"       -- Use system clipboard
opt.updatetime = 250                -- Faster update time
opt.timeoutlen = 300                -- Time to wait for mapped sequence
opt.hidden = true                   -- Allow hidden buffers
opt.wrap = true                     -- Wrap lines
opt.linebreak = true                -- Don't break words when wrapping
opt.completeopt = {                 -- Better completion experience
  "menu",
  "menuone",
  "noselect"
}

-- File handling
opt.swapfile = false                -- Don't use swapfile
opt.backup = false                  -- Don't create backup files
opt.undofile = true                 -- Persistent undo history
opt.undodir = vim.fn.stdpath("data") .. "/undodir"

-- Set up diagnostic appearance
vim.diagnostic.config({
  virtual_text = {
    prefix = '●',
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

-- Customize diagnostic signs
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
