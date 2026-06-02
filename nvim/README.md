# Neovim Configuration Keymap Reference

This document contains all custom keymaps defined in this Neovim configuration.

**Leader Key:** `<Space>`

---

## Table of Contents

- [General Navigation & Windows](#general-navigation--windows)
- [File Explorer](#file-explorer)
- [Telescope (Fuzzy Finder)](#telescope-fuzzy-finder)
- [LSP (Language Server Protocol)](#lsp-language-server-protocol)
- [Debugging (DAP)](#debugging-dap)
- [Comments](#comments)
- [Completion (nvim-cmp)](#completion-nvim-cmp)
- [Java Development (JDTLS)](#java-development-jdtls)
- [Spring Boot](#spring-boot)

---

## General Navigation & Windows

| Mode | Keymap       | Description                    |
| ---- | ------------ | ------------------------------ |
| `n`  | `<Esc>`      | Remove search highlights       |
| `t`  | `<Esc><Esc>` | Exit terminal mode             |
| `n`  | `<left>`     | Disabled (reminds to use h)    |
| `n`  | `<right>`    | Disabled (reminds to use l)    |
| `n`  | `<up>`       | Disabled (reminds to use k)    |
| `n`  | `<down>`     | Disabled (reminds to use j)    |
| `n`  | `<C-h>`      | Move focus to the left window  |
| `n`  | `<C-l>`      | Move focus to the right window |
| `n`  | `<C-j>`      | Move focus to the lower window |
| `n`  | `<C-k>`      | Move focus to the upper window |
| `n`  | `<leader>sv` | Split window vertically        |
| `n`  | `<leader>sh` | Split window horizontally      |
| `v`  | `<`          | Indent left in visual mode     |
| `v`  | `>`          | Indent right in visual mode    |

---

## File Explorer

| Mode | Keymap      | Description                     |
| ---- | ----------- | ------------------------------- |
| `n`  | `<leader>e` | Toggle file explorer (NvimTree) |

---

## Telescope (Fuzzy Finder)

| Mode | Keymap       | Description              |
| ---- | ------------ | ------------------------ |
| `n`  | `<leader>ff` | Find files               |
| `n`  | `<leader>fg` | Find by grep (live grep) |
| `n`  | `<leader>fd` | Find diagnostics         |
| `n`  | `<leader>fr` | Finder resume            |
| `n`  | `<leader>f.` | Find recent files        |
| `n`  | `<leader>fb` | Find existing buffers    |

---

## LSP (Language Server Protocol)

| Mode     | Keymap       | Description              |
| -------- | ------------ | ------------------------ |
| `n`      | `grh`        | Show hover documentation |
| `n`      | `grd`        | Go to definition         |
| `n`      | `grD`        | Go to declaration        |
| `n`      | `grR`        | Rename symbol            |
| `n`, `v` | `<leader>ga` | Code actions             |
| `n`      | `<leader>gr` | Go to references         |
| `n`      | `<leader>gi` | Go to implementations    |

**Note:** Additional default LSP keymaps are enabled:

- `gra` (Normal/Visual): Code actions
- `gri`: Go to implementation
- `grn`: Rename symbol
- `grr`: Show references
- `grt`: Go to type definition
- `gO`: Document symbols
- `<C-S>` (Insert): Signature help
- `an`/`in` (Visual/Operator-pending): Outer/inner incremental selections

---

## Debugging (DAP)

| Mode | Keymap       | Description       |
| ---- | ------------ | ----------------- |
| `n`  | `<leader>dt` | Toggle breakpoint |
| `n`  | `<leader>ds` | Start debugger    |
| `n`  | `<leader>dc` | Close debugger UI |

---

## Comments

| Mode | Keymap      | Description                      |
| ---- | ----------- | -------------------------------- |
| `n`  | `<leader>/` | Toggle comment on current line   |
| `v`  | `<leader>/` | Toggle comment on selected lines |

---

## Completion (nvim-cmp)

These keymaps work in **Insert mode** when the completion menu is active:

| Mode     | Keymap      | Description                                          |
| -------- | ----------- | ---------------------------------------------------- |
| `i`      | `<C-k>`     | Previous suggestion                                  |
| `i`      | `<C-j>`     | Next suggestion                                      |
| `i`      | `<C-b>`     | Scroll docs up (4 lines)                             |
| `i`      | `<C-f>`     | Scroll docs down (4 lines)                           |
| `i`      | `<C-Space>` | Show completion suggestions                          |
| `i`      | `<C-e>`     | Close completion window                              |
| `i`      | `<CR>`      | Confirm selected completion                          |
| `i`, `s` | `<Tab>`     | Next item / Jump to next snippet placeholder         |
| `i`, `s` | `<S-Tab>`   | Previous item / Jump to previous snippet placeholder |

---

## Java Development (JDTLS)

### Commands

- `:JdtCompile` - Compile Java project
- `:JdtUpdateConfig` - Update project configuration
- `:JdtBytecode` - Show bytecode (javap)
- `:JdtJshell` - Open JShell

### Keymaps

| Mode | Keymap       | Description                     |
| ---- | ------------ | ------------------------------- |
| `n`  | `<leader>Jo` | Organize imports                |
| `n`  | `<leader>Jv` | Extract variable                |
| `v`  | `<leader>Jv` | Extract variable from selection |
| `n`  | `<leader>JC` | Extract constant                |
| `v`  | `<leader>JC` | Extract constant from selection |
| `n`  | `<leader>Jt` | Test method under cursor        |
| `v`  | `<leader>Jt` | Test method in selection        |
| `n`  | `<leader>JT` | Test entire class               |
| `n`  | `<leader>Ju` | Update project config           |

---

## Spring Boot

| Mode | Keymap       | Description                 |
| ---- | ------------ | --------------------------- |
| `n`  | `<leader>Jr` | Run Spring Boot application |
| `n`  | `<leader>Jc` | Generate new class          |
| `n`  | `<leader>Ji` | Generate new interface      |
| `n`  | `<leader>Je` | Generate new enum           |

---

## Plugin Information

This configuration uses the following key plugins:

- **lazy.nvim** - Plugin manager
- **nvim-tree** - File explorer
- **telescope.nvim** - Fuzzy finder
- **nvim-lspconfig** - LSP configuration
- **nvim-cmp** - Autocompletion
- **nvim-dap** - Debug Adapter Protocol
- **nvim-jdtls** - Java language server
- **springboot-nvim** - Spring Boot utilities
- **Comment.nvim** - Easy commenting
- **gitsigns.nvim** - Git integration
- **which-key.nvim** - Keymap hints

---

_Generated from Neovim configuration files_
