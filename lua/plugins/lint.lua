return {
  "mfussenegger/nvim-lint",
  opts = {
    linters = {
      -- markdownlint-cli2 giải quyết config theo CWD chứ không đi ngược lên từ thư mục
      -- của file (README của nó: "glob expressions should match files under the current
      -- directory; the configuration for that directory will apply to the entire tree").
      -- nvim-lint mặc định chạy linter ở cwd của nvim, nên mở nvim trong một project
      -- không có file .markdownlint* là rơi về default MD013 = 80 ký tự → cảnh báo tràn
      -- lan trên mọi CLAUDE.md/README.
      --
      -- Đặt cwd = thư mục chứa config markdownlint GẦN NHẤT tính từ file đi lên.
      -- Nhờ vậy giữ đúng ngữ nghĩa "project có config riêng thì config đó thắng", còn
      -- không có thì rơi về ~/.markdownlint-cli2.yaml.
      ["markdownlint-cli2"] = {
        cwd = function()
          local names = {
            ".markdownlint-cli2.jsonc",
            ".markdownlint-cli2.yaml",
            ".markdownlint-cli2.cjs",
            ".markdownlint.jsonc",
            ".markdownlint.json",
            ".markdownlint.yaml",
            ".markdownlint.yml",
            ".markdownlint.cjs",
          }
          local from = vim.api.nvim_buf_get_name(0)
          from = from ~= "" and vim.fs.dirname(from) or vim.uv.cwd()
          local found = vim.fs.find(names, { upward = true, path = from, limit = 1 })
          return found[1] and vim.fs.dirname(found[1]) or vim.env.HOME
        end,
      },
    },
  },
}
