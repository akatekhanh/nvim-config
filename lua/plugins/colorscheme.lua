return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {
      -- mocha để khớp WezTerm (config/appearance.lua cũng dùng Catppuccin Mocha).
      -- frappe có base #303446, sáng hơn mocha (#1e1e2e) ~68%, nên mỗi lần mở nvim là
      -- màu nền nhảy một bậc so với shell.
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      term_colors = true,
      -- Vùng code trong suốt để thấy backdrop của WezTerm...
      transparent_background = true,
      -- ...nhưng sidebar và popup thì ĐỤC. Để mọi thứ trong suốt thì neo-tree,
      -- telescope và các float đều lẫn vào ảnh nền, chữ không có nền phẳng để tựa.
      custom_highlights = function(C)
        local panel = C.mantle -- tối hơn base một bậc → panel nổi khỏi vùng code
        local input = C.surface0 -- ô nhập liệu nổi hơn panel một bậc
        return {
          -- sidebar
          NeoTreeNormal = { bg = panel },
          NeoTreeNormalNC = { bg = panel },
          NeoTreeEndOfBuffer = { bg = panel },
          NeoTreeWinSeparator = { bg = panel, fg = panel },
          NeoTreeTabInactive = { bg = panel },
          NeoTreeStatusLine = { bg = panel },

          -- float / popup nói chung
          NormalFloat = { bg = panel },
          FloatBorder = { bg = panel, fg = C.surface1 },
          FloatTitle = { bg = panel, fg = C.blue },

          -- telescope
          TelescopeNormal = { bg = panel },
          TelescopeBorder = { bg = panel, fg = panel },
          TelescopeResultsNormal = { bg = panel },
          TelescopeResultsBorder = { bg = panel, fg = panel },
          TelescopePreviewNormal = { bg = panel },
          TelescopePreviewBorder = { bg = panel, fg = panel },
          TelescopePromptNormal = { bg = input },
          TelescopePromptBorder = { bg = input, fg = input },
          TelescopePromptTitle = { bg = input, fg = C.blue },

          -- which-key / noice
          WhichKeyNormal = { bg = panel },
          WhichKeyBorder = { bg = panel, fg = C.surface1 },
          NoicePopup = { bg = panel },
          NoiceCmdlinePopup = { bg = panel },
          NoiceCmdlinePopupBorder = { bg = panel, fg = C.surface1 },
        }
      end,
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
