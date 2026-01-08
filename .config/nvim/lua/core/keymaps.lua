-- ~/.config/nvim/lua/core/keymaps.lua
-- Essential key mappings for Neovim

-- Define local variables for easier reference
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Set leader key (should match what's in options.lua)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--[[ Essential general mappings ]]--

-- Better window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Stay in indent mode when indenting
map("v", "<", "<gv", { desc = "Unindent and keep selection" })
map("v", ">", ">gv", { desc = "Indent and keep selection" })

-- Clear search highlight with escape
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

-- Quick save
map({"n", "i"}, "<C-s>", "<cmd>w<CR>", { desc = "Save file" })

-- Buffer navigation
map("n", "<S-l>", "<cmd>bnext<CR>", { desc = "Next buffer" })
map("n", "<S-h>", "<cmd>bprevious<CR>", { desc = "Previous buffer" })

--[[ Treesitter specific mappings ]]--

-- Incremental selection
map("n", "<leader>tt", function()
  require("nvim-treesitter.incremental_selection").init_selection()
end, { desc = "Start incremental selection" })

map("n", "<leader>tn", function()
  require("nvim-treesitter.incremental_selection").node_incremental()
end, { desc = "Grow selection" })

map("n", "<leader>tp", function()
  require("nvim-treesitter.incremental_selection").node_decremental()
end, { desc = "Shrink selection" })

-- Text object selections (when in visual mode or after an operator)
map({"o", "x"}, "af", "@function.outer", { desc = "Select outer function" })
map({"o", "x"}, "if", "@function.inner", { desc = "Select inner function" })
map({"o", "x"}, "ac", "@class.outer", { desc = "Select outer class" })
map({"o", "x"}, "ic", "@class.inner", { desc = "Select inner class" })
map({"o", "x"}, "aa", "@parameter.outer", { desc = "Select outer parameter/argument" })
map({"o", "x"}, "ia", "@parameter.inner", { desc = "Select inner parameter/argument" })

--[[ File explorer mappings ]]--

-- Toggle file explorer
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })

-- Focus file explorer (open and focus if closed)
map("n", "<leader>fe", "<cmd>NvimTreeFocus<CR>", { desc = "Focus file explorer" })

-- Find file in tree (reveal current file)
map("n", "<leader>ff", "<cmd>NvimTreeFindFile<CR>", { desc = "Find current file in explorer" })

-- Collapse all directories in tree
map("n", "<leader>fc", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })

-- Refresh the file explorer
map("n", "<leader>fr", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })
