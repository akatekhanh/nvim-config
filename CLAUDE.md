# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a LazyVim-based Neovim configuration. LazyVim provides the core plugin management and default configurations, with custom overrides in `lua/plugins/`.

## Architecture

```
init.lua              → Entry point, loads config.lazy
lua/
├── config/
│   ├── lazy.lua      → Lazy.nvim bootstrap and plugin setup
│   ├── options.lua   → Vim options (picker: telescope, rust: rust-analyzer)
│   ├── keymaps.lua   → Custom keymaps (extends LazyVim defaults)
│   └── autocmds.lua  → Custom autocommands
└── plugins/          → Plugin specs (override/extend LazyVim)
    ├── claudecode.lua   → Claude Code integration (<leader>a prefix)
    ├── colorscheme.lua  → Catppuccin frappe with transparency
    ├── telescope.lua    → Customized with dropdown themes, fzf
    ├── neo-tree.lua     → File explorer config
    ├── toggleterm.lua   → Floating terminal (<C-\>)
    └── image-viewer.lua → Kitty image backend
```

## Key Custom Keymaps

- `<leader>a` - AI/Claude Code prefix
- `<leader>ac` - Toggle Claude Code terminal
- `<leader>as` - Send visual selection to Claude
- `<leader>aa/ad` - Accept/Deny diffs
- `<C-\>` - Toggle floating terminal

## Enabled LazyVim Extras

Languages: Python, Rust, Docker, Terraform, Ansible, Helm, JSON, YAML, Markdown, Astro
Coding: nvim-cmp, mini-surround, yanky
Editor: telescope, dial, inc-rename, overseer
AI: Codeium
Formatting: Black, Prettier

## Commands

```bash
# Format Lua files
stylua lua/

# Check health
nvim --headless "+checkhealth" "+qa"
```

## Style

- Lua: 2 spaces, 120 column width (stylua.toml)
- Plugin specs return tables with lazy.nvim format
- Use `opts` for configuration, `config` function only when needed
