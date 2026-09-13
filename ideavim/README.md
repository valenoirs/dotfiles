# IdeaVim Configuration

This directory contains the IdeaVim configuration ported directly from the Neovim setup in `../nvim`. It reproduces your keymaps, navigation habits, plugin workflows (Telescope, LSP, DAP, Neotest, JDTLS, Comment, GitSigns, etc.), and editor options inside IntelliJ IDEA.

## Installation

Pick one of the following methods to link this configuration:

### Option 1: Standard Home Directory Symlink (Recommended)
```bash
ln -s "$PWD/ideavim/.ideavimrc" ~/.ideavimrc
```

### Option 2: XDG Config Directory Symlink
```bash
ln -s "$PWD/ideavim" ~/.config/ideavim
```
*(IdeaVim automatically detects `~/.config/ideavim/ideavimrc` or `~/.ideavimrc`)*

---

## Recommended IntelliJ Plugins

Make sure you have the following installed in IntelliJ (**Settings > Plugins**):
- **IdeaVim** (Required)
- **IdeaVim-EasyMotion** (Optional, if you want enhanced motion jumps)
- **Which-Key** (IdeaVim has built-in `set which-key` emulation enabled)

---

## Configuration Details

### 1. General Settings & Options

| Neovim (`nvim/lua/config/options.lua`) | IdeaVim Setting | Description |
| -------------------------------------- | --------------- | ----------- |
| `o.number = true` | `set number` | Show line numbers |
| `o.wrap = false` | `set nowrap` | Disable line wrapping |
| `o.scrolloff = 20` | `set scrolloff=20` | Keep 20 lines visible above/below cursor |
| `o.sidescrolloff = 20` | `set sidescrolloff=20` | Keep 20 columns visible left/right |
| `o.expandtab = true` | `set expandtab` | Use spaces instead of tabs |
| `o.shiftwidth = 4` | `set shiftwidth=4` | Indent size = 4 spaces |
| `o.tabstop = 4` | `set tabstop=4` | Tab character width = 4 |
| `o.softtabstop = 4` | `set softtabstop=4` | Soft tab stop = 4 |
| `o.smartindent = true` | `set smartindent` | Auto-indent new lines |
| `o.clipboard = "unnamedplus"` | `set clipboard+=unnamedplus,unnamed` | Seamless system clipboard sharing |
| `o.showmode = false` | `set noshowmode` | Hide default mode indicator |
| `o.splitbelow = true` | `set splitbelow` | Split horizontal windows below |
| `o.splitright = true` | `set splitright` | Split vertical windows to the right |
| `o.timeoutlen = 1000` | `set timeoutlen=1000` | Keymap timeout length |
| `o.cursorline = true` | `set cursorline` | Highlight current cursor line |
| `o.hlsearch = true` | `set hlsearch` | Highlight search results |
| `o.ignorecase = true` | `set ignorecase` | Case-insensitive search |
| `o.smartcase = true` | `set smartcase` | Case-sensitive search if uppercase is typed |

### 2. Emulated Plugins (`set <plugin>`)
- `set surround`: Emulates `tpope/vim-surround` (change/add/delete quotes, brackets).
- `set multiple-cursors`: Emulates multi-caret editing (`<A-n>`, `<A-x>`, `<A-p>`).
- `set commentary`: Emulates line and block comments (`gcc`, `gc`).
- `set argtextobj`: Text objects for function arguments (`cia`, `daa`).
- `set textobj-entire`: Buffer text objects (`vae`, `dae`, `yae`).
- `set highlightedyank`: Visual feedback on yanked text.
- `set nerdtree`: Allows `:NERDTreeToggle` to control IntelliJ's Project tool window.
- `set which-key`: Displays key popup suggestions when leader key is pressed.
- `set ideajoin`: Joins comments, annotations, and code smartly according to IntelliJ code style.

---

## Keymap Reference

**Leader Key:** `<Space>`

### Navigation & Arrow Training

| Mode | Keymap | Action / Description |
| ---- | ------ | -------------------- |
| `n` | `<Esc>` | Clear search highlights (`:nohlsearch`) |
| `n` | `<left>`, `<right>`, `<up>`, `<down>` | Echo reminder to use `h`, `j`, `k`, `l` |
| `v` | `<`, `>` | Indent left/right while maintaining visual selection |
| `n` | `<leader>{` | Append ` {}` to end of current line |
| `n` | `<leader>;` | Append `;` to end of current line |

### Window Splits & Resizing

| Mode | Keymap | IntelliJ Action | Description |
| ---- | ------ | --------------- | ----------- |
| `n` | `<leader>sv` | `SplitVertically` | Split window vertically |
| `n` | `<leader>sh` | `SplitHorizontally` | Split window horizontally |
| `n` | `<leader>sV` | `SplitVertically` | Split window vertically |
| `n` | `<leader>sH` | `SplitHorizontally` | Split window horizontally |
| `n` | `<C-h>`, `<C-j>`, `<C-k>`, `<C-l>` | `<C-w>h/j/k/l` | Move focus between split editor windows |
| `n` | `<M-k>` / `<A-k>` | `ResizeToolWindowUp` | Increase window height |
| `n` | `<M-j>` / `<A-j>` | `ResizeToolWindowDown` | Decrease window height |
| `n` | `<M-h>` / `<A-h>` | `ResizeToolWindowLeft` | Decrease window width |
| `n` | `<M-l>` / `<A-l>` | `ResizeToolWindowRight` | Increase window width |
| `n` | `<leader>z` | `HideAllWindows` | Toggle maximize editor / restore tool windows |

### Tabs & Buffers

| Mode | Keymap | IntelliJ Action | Description |
| ---- | ------ | --------------- | ----------- |
| `n` | `<Tab>` | `NextTab` | Next open editor tab |
| `n` | `<S-Tab>` | `PreviousTab` | Previous open editor tab |
| `n` | `<leader>tn` | `NewElement` | New file / element |
| `n` | `<leader>tc` | `CloseContent` | Close current tab |
| `n` | `<leader>bd` | `CloseContent` | Close current tab |
| `n` | `<leader>bD` | `CloseContent` | Close current tab |
| `n` | `<leader>bad` | `CloseAllEditors` | Close all tabs |
| `n` | `<leader>baD` | `CloseAllEditors` | Close all tabs |
| `n` | `<leader>bn` | `NewScratchFile` | Open empty scratch buffer |

### File Explorer & Fuzzy Finding (Telescope)

| Mode | Keymap | IntelliJ Action | Description |
| ---- | ------ | --------------- | ----------- |
| `n` | `<leader>e` | `ActivateProjectToolWindow` | Toggle Project tool window |
| `n` | `<leader>ff` | `GotoFile` | Find files by name |
| `n` | `<leader>fF` | `GotoFile` | Find all files |
| `n` | `<leader>fg` | `FindInPath` | Find by grep (Project search) |
| `n` | `<leader>fG` | `FindInPath` | Find by grep |
| `n` | `<leader>fd` | `ActivateProblemsViewToolWindow` | View project problems & diagnostics |
| `n` | `<leader>fD` | `ShowErrorDescription` | Open diagnostic / error popup |
| `n` | `<leader>fr` | `RecentLocations` | Recent locations / resume |
| `n` | `<leader>f.` | `RecentFiles` | Recent files |
| `n` | `<leader>fb` | `RecentFiles` | Switch open buffers/files |

### Comments

| Mode | Keymap | IntelliJ Action | Description |
| ---- | ------ | --------------- | ----------- |
| `n` | `<leader>/` | `CommentByLineComment` | Toggle comment on current line |
| `v` | `<leader>/` | `CommentByLineComment` | Toggle comment on selected lines |

### Code Navigation & LSP

| Mode | Keymap | IntelliJ Action | Description |
| ---- | ------ | --------------- | ----------- |
| `n` | `grh` | `QuickJavaDoc` | Show hover documentation |
| `n` | `grd` | `GotoDeclaration` | Go to definition |
| `n` | `grD` | `GotoTypeDeclaration` | Go to type declaration |
| `n` | `grR` / `grn` | `RenameElement` | Rename symbol |
| `n`, `v` | `<leader>ga` / `gra` | `ShowIntentionActions` | Show code actions (Alt+Enter) |
| `n` | `<leader>gr` / `grr` | `ShowUsages` | Find usages / references |
| `n` | `<leader>gi` / `gri` | `GotoImplementation` | Go to implementations |
| `n` | `grt` | `GotoTypeDeclaration` | Go to type definition |
| `n` | `gO` | `FileStructurePopup` | Outline / Document symbols popup |
| `n` | `[d` | `GotoPreviousError` | Jump to previous diagnostic error |
| `n` | `]d` | `GotoNextError` | Jump to next diagnostic error |
| `n` | `gG` | `Synchronize` | Synchronize / reload project |
| `n`, `v` | `<leader>cf` | `ReformatCode` | Reformat code |

### Debugging (DAP)

| Mode | Keymap | IntelliJ Action | Description |
| ---- | ------ | --------------- | ----------- |
| `n` | `<leader>dt` | `ToggleLineBreakpoint` | Toggle line breakpoint |
| `n` | `<leader>ds` | `Debug` | Start debugger |
| `n` | `<leader>dc` | `Resume` | Continue debugging |
| `n` | `<leader>dq` | `Stop` | Stop debugger |
| `n` | `<leader>du` | `ActivateDebugToolWindow` | Toggle Debug tool window |
| `n` | `<leader>di` | `StepInto` | Step Into |
| `n` | `<leader>dn` | `StepOver` | Step Over |
| `n` | `<leader>do` | `StepOut` | Step Out |
| `n` | `<leader>db` | `Debugger.DropFrame` | Drop Frame / Step Back |
| `n` | `<leader>dw` | `Debugger.AddToWatch` | Add / view watch expression |
| `n` | `<leader>dr` | `Rerun` | Restart debugging session |
| `n` | `<leader>de` | `EvaluateExpression` | Open evaluate expression dialog |
| `n`, `v` | `<leader>d?` | `QuickEvaluateExpression` | Quick floating evaluate expression |

### Testing (Neotest)

| Mode | Keymap | IntelliJ Action | Description |
| ---- | ------ | --------------- | ----------- |
| `n` | `<leader>tr` | `ContextRun` | Run test nearest to cursor |
| `n` | `<leader>td` | `ContextDebug` | Debug test nearest to cursor |
| `n` | `<leader>tf` | `RunClass` | Run current test class/file |
| `n` | `<leader>tp` | `Run` | Run current package |
| `n` | `<leader>tw` | `Run` | Run test configuration / suite |
| `n` | `<leader>ts` | `ActivateRunToolWindow` | Toggle Run/Test tool window |
| `n` | `<leader>to` | `ActivateRunToolWindow` | View test output |

### Java & Spring Boot Development (JDTLS)

| Mode | Keymap | IntelliJ Action | Description |
| ---- | ------ | --------------- | ----------- |
| `n` | `<leader>Jo` | `OptimizeImports` | Organize imports |
| `n`, `v` | `<leader>Jv` | `IntroduceVariable` | Extract variable |
| `n`, `v` | `<leader>JC` | `IntroduceConstant` | Extract constant |
| `n`, `v` | `<leader>Jt` | `ContextRun` | Run method/class under cursor |
| `n` | `<leader>JT` | `RunClass` | Run entire test class |
| `n` | `<leader>Ju` | `ExternalSystem.RefreshAllProjects` | Update / sync Gradle or Maven project |
| `n` | `<leader>Jr` | `ChooseRunConfiguration` | Run Spring Boot application |
| `n` | `<leader>Jn` | `NewElement` | Create new Java item |
| `n` | `<leader>Jc` | `NewClass` | Create new Java class |
| `n` | `<leader>Ji` | `NewClass` | Create new Java interface |
| `n` | `<leader>Je` | `NewClass` | Create new Java enum |

### Git & Version Control

| Mode | Keymap | IntelliJ Action | Description |
| ---- | ------ | --------------- | ----------- |
| `n` | `<leader>gb` | `Annotate` | Toggle Git line blame in gutter |
| `n` | `<leader>gg` | `ActivateVersionControlToolWindow` | Open Git / VCS tool window |
| `n` | `<leader>gc` | `CheckinProject` | Open Git Commit window |
| `n` | `<leader>gp` | `Vcs.Push` | Push commits |
| `n` | `[c` | `VcsShowPrevChangeMarker` | Jump to previous VCS change |
| `n` | `]c` | `VcsShowNextChangeMarker` | Jump to next VCS change |

### Multiple Cursors

| Mode | Keymap | IntelliJ Action | Description |
| ---- | ------ | --------------- | ----------- |
| `n`, `x` | `<A-n>` | `SelectNextOccurrence` | Add cursor to next occurrence |
| `n`, `x` | `<A-x>` | `UnselectPreviousOccurrence` | Remove current occurrence |
| `n`, `x` | `<A-p>` | `SelectPreviousOccurrence` | Jump to previous occurrence |
| `n`, `x` | `<A-S-n>` | `SelectAllOccurrences` | Select all occurrences in file |

### HTTP Client (Kulala)

| Mode | Keymap | IntelliJ Action | Description |
| ---- | ------ | --------------- | ----------- |
| `n` | `<leader>rr` | `ContextRun` | Run HTTP request under cursor in `.http` files |

### Reloading IdeaVim Configuration

| Mode | Keymap | Description |
| ---- | ------ | ----------- |
| `n` | `<leader>so` | Source and reload `~/.ideavimrc` without restarting IDE |
