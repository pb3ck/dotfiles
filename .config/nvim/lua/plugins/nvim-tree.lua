-- ~/.config/nvim/lua/plugins/nvim-tree.lua
-- File explorer sidebar configuration

return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- For file icons
    },
    version = "*",
    lazy = false,
    config = function()
      -- Disable netrw (Vim's built-in file explorer)
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      require("nvim-tree").setup({
        sort_by = "case_sensitive",
        view = {
          width = 30, -- Width of the sidebar
          side = "left", -- Position on the left like VSCode
          number = false,
          relativenumber = false,
          signcolumn = "yes",
        },
        renderer = {
          group_empty = true,
          icons = {
            show = {
              file = true,
              folder = true,
              folder_arrow = true,
              git = true,
            },
          },
        },
        filters = {
          dotfiles = false, -- Show hidden files
        },
        git = {
          enable = true, -- Show git status
          ignore = false, -- Don't hide gitignored files
        },
        actions = {
          open_file = {
            quit_on_open = false, -- Don't close the tree when opening a file
            resize_window = true, -- Resize the tree when opening a file
          },
        },
      })

      -- Auto open nvim-tree when opening a directory
      local function open_nvim_tree(data)
        -- Buffer is a directory
        local directory = vim.fn.isdirectory(data.file) == 1
        if directory then
          vim.cmd.cd(data.file)
          require("nvim-tree.api").tree.open()
        end
      end

      -- Auto open when starting neovim on a directory
      vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
    end,
  },
}
