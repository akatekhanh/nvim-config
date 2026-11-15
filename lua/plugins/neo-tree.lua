return {
  "neo-tree.nvim",
  opts = {
    default_component_configs = {
      git_status = {
        symbols = {
          added     = "✚",  -- plus: new file added to git
          modified  = "",  -- pencil: file has changes
          deleted   = "✖",  -- x mark: file removed
          renamed   = "➜",  -- arrow: file moved/renamed
          untracked = "★",  -- star: new file not yet tracked
          ignored   = "◌",  -- dotted circle: git ignored
          unstaged  = "○",  -- empty circle: changes not staged
          staged    = "●",  -- filled circle: ready to commit
          conflict  = "",  -- warning: merge conflict
        },
      },
    },
    filesystem = {
      filtered_items = {
        visible = false, -- hide filtered items on open
        hide_gitignored = true,
        hide_dotfiles = false,
        hide_by_name = {
          ".github",
          ".gitignore",
          "package-lock.json",
          ".changeset",
          ".prettierrc.json",
        },
        never_show = { ".git" },
      },
      -- `window` phải ở cấp `filesystem`, KHÔNG nằm trong `filtered_items`
      -- (filtered_items chỉ nhận visible/hide_*/never_show), nên trước đây dòng này
      -- bị bỏ qua hoàn toàn và sidebar vẫn rộng mặc định 40 cột.
      window = {
        width = 30,
      },
    },
  },
}
