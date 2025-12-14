return {
  "folke/snacks.nvim",
  keys = {
    -- Snacks terminal on <C-/> (triggered by Cmd+j via WezTerm)
    { "<C-/>", function() require("snacks").terminal() end, desc = "Toggle Snacks Terminal", mode = { "n", "t" } },
  },
  opts = {
    terminal = {
      win = {
        style = "terminal",
        wo = {
          winblend = 0,
          winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
        },
        border = "rounded",
        backdrop = false,
      },
    },
  },
  init = function()
    -- Make terminal background transparent
    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = function()
        vim.api.nvim_set_hl(0, "SnacksTerminal", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "SnacksTerminalNormal", { bg = "NONE" })
      end,
    })
    -- Apply immediately
    vim.api.nvim_set_hl(0, "SnacksTerminal", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "SnacksTerminalNormal", { bg = "NONE" })
  end,
}
