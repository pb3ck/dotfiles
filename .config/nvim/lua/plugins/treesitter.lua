-- ~/.config/nvim/lua/plugins/treesitter.lua
-- Treesitter configuration
return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
      require("nvim-treesitter.configs").setup({
        -- A list of parser names, or "all"
        ensure_installed = {
          "lua",
          "vim",
          "vimdoc",
          "bash",
          "c",
          "cpp",
          "javascript",
          "python",
          "markdown",
          "markdown_inline",
        },
        -- Install parsers synchronously (only applied to ensure_installed)
        sync_install = false,
        -- Automatically install missing parsers when entering buffer
        auto_install = true,
        -- Highlighting
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        -- Indentation
        indent = {
          enable = true,
        },
        -- Incremental selection based on the named nodes from the grammar
        incremental_selection = {
          enable = true,
          keymaps = {
            -- These are set in keymaps.lua
            init_selection = false,
            node_incremental = false,
            scope_incremental = false,
            node_decremental = false,
          },
        },
        -- Text objects
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              -- These are set in keymaps.lua
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
              ["aa"] = "@parameter.outer",
              ["ia"] = "@parameter.inner",
            },
          },
          move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
          },
        },
      })
    end,
  },
}
