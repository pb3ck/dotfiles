-- ~/.config/nvim/lua/plugins/colorscheme.lua
-- Modus Vivendi (black) theme configuration

return {
  -- Modus Themes (includes Modus Vivendi - black theme)
  {
    "miikanissi/modus-themes.nvim",
    priority = 1000, -- Load this plugin first
    lazy = false,    -- Load during startup
    config = function()
      -- Configure the theme
      require("modus-themes").setup({
        -- Force dark style (modus_vivendi) instead of auto-detection
        style = "modus_vivendi",

        -- Theme variant (default is most neutral, also available: tinted, deuteranopia, tritanopia)
        variant = "default",

        -- Additional options
        transparent = false,             -- Set to true if you want transparent background
        dim_inactive = false,            -- Dim inactive windows
        hide_inactive_statusline = false, -- Hide inactive window statuslines

        -- Background options for line numbers and sign columns
        line_nr_column_background = true, -- Distinct background for line number column
        sign_column_background = true     -- Distinct background for sign column
      })

      -- Set the colorscheme
      vim.cmd("colorscheme modus")
    end,
  },
}
