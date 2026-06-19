return {
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      -- Color de fondo "soft" de Gruvbox
      local bg_color = "#1c1c1c" 

      vim.o.background = "dark"
      vim.o.termguicolors = true

      require("gruvbox").setup({
        contrast = "soft",
        transparent_mode = false, 
        
        palette_overrides = {
           dark0_soft = bg_color,
           dark0_hard = bg_color,
        },

        -- ANULACIONES DE ÁREAS PERIFÉRICAS
        overrides = {
            -- ⭐ NUEVO: Fondo de la barra de título superior (WinBar)
            WinBar = { bg = bg_color }, 
            
            -- Para la WinBar de ventanas NO activas (si aplica)
            WinBarNC = { bg = bg_color }, 

            -- Áreas ya configuradas
            Normal = { bg = bg_color },
            NormalNC = { bg = bg_color }, 
            NormalFloat = { bg = bg_color }, 
            LineNr = { bg = bg_color }, 
            CursorLineNr = { bg = bg_color },
            SignColumn = { bg = bg_color }, 
            FoldColumn = { bg = bg_color }, 
            EndOfBuffer = { bg = bg_color }, 
        },
      })

      vim.cmd([[colorscheme gruvbox]])
    end,
  },
}
