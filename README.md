# My Neovim Configuration

A personalized Neovim setup with LSP support, fuzzy finding, Git integration, and more.

---

## Table of Contents

- [Editor Settings](#editor-settings)
- [Basic Vim Commands](#basic-vim-commands)
  - [Modes](#modes)
  - [Navigation](#navigation)
  - [Window Management](#window-management)
  - [Editing](#editing)
  - [Search & Replace](#search--replace)
  - [Registers & Marks](#registers--marks)
  - [Macros](#macros)
- [Custom Keymaps](#custom-keymaps)
  - [General Editing](#general-editing)
  - [Quickfix & Location List](#quickfix--location-list)
  - [LSP & Diagnostics](#lsp--diagnostics-buffer-local-on-attach)
  - [Completion (nvim-cmp)](#completion-nvim-cmp)
  - [Search & Files (Telescope)](#search--files-telescope)
  - [File Tree](#file-tree)
  - [Git (Fugitive)](#git-fugitive)
  - [Diagnostics List (Trouble)](#diagnostics-list-trouble)
  - [Testing (neotest)](#testing-neotest)
  - [Documentation (neogen)](#documentation-neogen)
  - [Undo & History](#undo--history)
  - [LaTeX (Vimtex)](#latex-vimtex)
  - [Focus / Zen](#focus--zen)
  - [Terminal / Sessions](#terminal--sessions)
  - [Fun](#fun)
- [Plugins Without Keymaps](#plugins-without-keymaps)

---

## Editor Settings

| Setting | Value | Description |
|---------|-------|-------------|
| Leader Key | `<Space>` | Prefix for custom commands |
| Line Numbers | Relative | Shows relative line numbers with current line absolute |
| Tab Width | 4 spaces | Uses spaces instead of tabs |
| Smart Indent | Enabled | Auto-indents new lines intelligently |
| Word Wrap | Disabled | Lines don't wrap visually |
| Swap Files | Disabled | No `.swp` files created |
| Backup Files | Disabled | No backup files created |
| Undo History | Persistent | Saved to `~/.vim/undodir` |
| Search Highlight | Disabled | No persistent highlight after search |
| Incremental Search | Enabled | Shows matches as you type |
| Scroll Offset | 8 lines | Keeps 8 lines visible above/below cursor |
| Sign Column | Always visible | Shows git/diagnostic signs |
| Color Column | 90 | Vertical line at column 90 |
| Update Time | 50ms | Faster CursorHold events |
| Cursor Style | Block | Block cursor in all modes |

---

## Basic Vim Commands

### Modes

| Key | Action |
|-----|--------|
| `i` | Enter Insert mode (before cursor) |
| `I` | Enter Insert mode (beginning of line) |
| `a` | Enter Insert mode (after cursor) |
| `A` | Enter Insert mode (end of line) |
| `o` | Open new line below and enter Insert mode |
| `O` | Open new line above and enter Insert mode |
| `v` | Enter Visual mode (character-wise) |
| `V` | Enter Visual line mode |
| `<C-v>` | Enter Visual block mode |
| `R` | Enter Replace mode |
| `<Esc>` or `jj` | Return to Normal mode |
| `:` | Enter Command-line mode |

### Navigation

#### Basic Movement
| Key | Action |
|-----|--------|
| `h` | Move left |
| `j` | Move down |
| `k` | Move up |
| `l` | Move right |
| `gj` / `gk` | Move down/up by visual line (for wrapped lines) |

#### Word Movement
| Key | Action |
|-----|--------|
| `w` | Next word (beginning) |
| `W` | Next WORD (space-delimited) |
| `b` | Previous word (beginning) |
| `B` | Previous WORD |
| `e` | Next word (end) |
| `E` | Next WORD (end) |
| `ge` | Previous word (end) |

#### Line Movement
| Key | Action |
|-----|--------|
| `0` | Beginning of line |
| `^` | First non-blank character |
| `$` | End of line |
| `g_` | Last non-blank character |
| `f{char}` | Jump to next `{char}` on line |
| `F{char}` | Jump to previous `{char}` on line |
| `t{char}` | Jump to before next `{char}` |
| `T{char}` | Jump to after previous `{char}` |
| `;` | Repeat last f/F/t/T |
| `,` | Repeat last f/F/t/T (reverse) |

#### File Movement
| Key | Action |
|-----|--------|
| `gg` | Go to first line |
| `G` | Go to last line |
| `{n}G` or `:{n}` | Go to line `n` |
| `{n}%` | Go to `n`% of file |
| `<C-d>` | Half-page down (recenters) |
| `<C-u>` | Half-page up (recenters) |
| `<C-f>` | Full page forward |
| `<C-b>` | Full page backward |
| `H` | Go to top of screen |
| `M` | Go to middle of screen |
| `L` | Go to bottom of screen |
| `zz` | Center current line on screen |
| `zt` | Move current line to top |
| `zb` | Move current line to bottom |

#### Text Object Movement
| Key | Action |
|-----|--------|
| `(` / `)` | Previous/next sentence |
| `{` / `}` | Previous/next paragraph |
| `[[` / `]]` | Previous/next section |
| `%` | Jump to matching bracket |

### Window Management

#### Creating Splits
| Key | Action |
|-----|--------|
| `<C-w>s` or `:sp` | Horizontal split |
| `<C-w>v` or `:vsp` | Vertical split |
| `:sp {file}` | Horizontal split with file |
| `:vsp {file}` | Vertical split with file |

#### Navigating Splits
| Key | Action |
|-----|--------|
| `<C-w>h` | Move to left split |
| `<C-w>j` | Move to split below |
| `<C-w>k` | Move to split above |
| `<C-w>l` | Move to right split |
| `<C-w>w` | Cycle through splits |
| `<C-w>p` | Go to previous split |

#### Resizing Splits
| Key | Action |
|-----|--------|
| `<C-w>=` | Make all splits equal size |
| `<C-w>_` | Maximize height |
| `<C-w>\|` | Maximize width |
| `<C-w>+` | Increase height |
| `<C-w>-` | Decrease height |
| `<C-w>>` | Increase width |
| `<C-w><` | Decrease width |
| `{n}<C-w>_` | Set height to `n` lines |
| `{n}<C-w>\|` | Set width to `n` columns |

#### Closing & Rearranging
| Key | Action |
|-----|--------|
| `<C-w>c` or `:close` | Close current split |
| `<C-w>o` or `:only` | Close all other splits |
| `<C-w>q` or `:q` | Quit current split |
| `<C-w>r` | Rotate splits downward/rightward |
| `<C-w>R` | Rotate splits upward/leftward |
| `<C-w>x` | Exchange with next split |
| `<C-w>H` | Move split to far left (vertical) |
| `<C-w>J` | Move split to bottom (horizontal) |
| `<C-w>K` | Move split to top (horizontal) |
| `<C-w>L` | Move split to far right (vertical) |
| `<C-w>T` | Move split to new tab |

#### Tabs
| Key | Action |
|-----|--------|
| `:tabnew` | Open new tab |
| `:tabnew {file}` | Open file in new tab |
| `gt` or `:tabn` | Next tab |
| `gT` or `:tabp` | Previous tab |
| `{n}gt` | Go to tab `n` |
| `:tabclose` | Close current tab |
| `:tabonly` | Close all other tabs |

### Editing

#### Basic Operations
| Key | Action |
|-----|--------|
| `x` | Delete character under cursor |
| `X` | Delete character before cursor |
| `r{char}` | Replace character with `{char}` |
| `s` | Substitute character (delete and enter Insert) |
| `S` or `cc` | Substitute entire line |
| `J` | Join line below to current line |
| `gJ` | Join without adding space |
| `~` | Toggle case of character |
| `g~{motion}` | Toggle case over motion |
| `gu{motion}` | Lowercase over motion |
| `gU{motion}` | Uppercase over motion |
| `.` | Repeat last change |
| `u` | Undo |
| `<C-r>` | Redo |

#### Delete, Change, Yank (with motions)
| Key | Action |
|-----|--------|
| `d{motion}` | Delete over motion |
| `dd` | Delete entire line |
| `D` | Delete to end of line |
| `c{motion}` | Change over motion (delete + Insert) |
| `cc` | Change entire line |
| `C` | Change to end of line |
| `y{motion}` | Yank (copy) over motion |
| `yy` | Yank entire line |
| `Y` | Yank entire line (remapped) |
| `p` | Paste after cursor |
| `P` | Paste before cursor |
| `gp` / `gP` | Paste and move cursor after |

#### Text Objects
Use with `d`, `c`, `y`, `v` — format: `{operator}{a/i}{object}`
- `a` = "around" (includes surrounding)
- `i` = "inner" (inside only)

| Object | Description |
|--------|-------------|
| `w` / `W` | Word / WORD |
| `s` | Sentence |
| `p` | Paragraph |
| `b` or `(` | Parentheses block |
| `B` or `{` | Braces block |
| `[` | Brackets block |
| `<` | Angle brackets |
| `t` | XML/HTML tag |
| `'` / `"` / `` ` `` | Quoted strings |

**Examples:**
- `ciw` — Change inner word
- `da(` — Delete around parentheses
- `yi"` — Yank inside double quotes
- `vat` — Visual select around tag
- `ci{` — Change inside braces

#### Indentation
| Key | Action |
|-----|--------|
| `>>` | Indent line |
| `<<` | Outdent line |
| `>{motion}` | Indent over motion |
| `<{motion}` | Outdent over motion |
| `==` | Auto-indent line |
| `={motion}` | Auto-indent over motion |
| `gg=G` | Auto-indent entire file |

### Search & Replace

| Key | Action |
|-----|--------|
| `/{pattern}` | Search forward |
| `?{pattern}` | Search backward |
| `n` | Next match (recenters) |
| `N` | Previous match (recenters) |
| `*` | Search word under cursor (forward) |
| `#` | Search word under cursor (backward) |
| `g*` / `g#` | Partial word search |
| `:noh` | Clear search highlighting |
| `:s/old/new/` | Replace first on line |
| `:s/old/new/g` | Replace all on line |
| `:%s/old/new/g` | Replace all in file |
| `:%s/old/new/gc` | Replace all with confirmation |

**Regex tips:**
- `\<word\>` — Match whole word
- `.` — Any character
- `.*` — Any characters (greedy)
- `\v` — "Very magic" mode (less escaping)

### Registers & Marks

#### Registers
| Key | Action |
|-----|--------|
| `"{reg}y{motion}` | Yank to register `{reg}` |
| `"{reg}p` | Paste from register `{reg}` |
| `"+y` / `"+p` | System clipboard |
| `"*y` / `"*p` | Selection clipboard |
| `"0` | Last yank |
| `"1`-`"9` | Delete history |
| `"_` | Black hole (discard) |
| `"/` | Last search pattern |
| `":` | Last command |
| `".` | Last inserted text |
| `"%` | Current filename |
| `:reg` | View all registers |

#### Marks
| Key | Action |
|-----|--------|
| `m{a-z}` | Set local mark |
| `m{A-Z}` | Set global mark (across files) |
| `` `{mark} `` | Jump to mark (exact position) |
| `'{mark}` | Jump to mark (line beginning) |
| `` `` `` | Jump to position before last jump |
| `''` | Jump to line before last jump |
| `` `. `` | Jump to last change |
| `` `^ `` | Jump to last insert |
| `:marks` | View all marks |
| `:delmarks {marks}` | Delete marks |

### Macros

| Key | Action |
|-----|--------|
| `q{a-z}` | Start recording macro to register |
| `q` | Stop recording |
| `@{a-z}` | Play macro from register |
| `@@` | Replay last macro |
| `{n}@{a-z}` | Play macro `n` times |
| `:reg {a-z}` | View macro contents |

**Example workflow:**
1. `qa` — Start recording to register `a`
2. Make your edits
3. `q` — Stop recording
4. `@a` — Replay the macro
5. `10@a` — Replay 10 more times

---

## Custom Keymaps

**Leader key:** `<Space>`

### General Editing
| Key | Mode | Action |
|-----|------|--------|
| `<leader>pv` | Normal | Open file explorer (Ex) |
| `jj` | Insert | Escape to Normal mode |
| `J` | Visual | Move selected lines down |
| `K` | Visual | Move selected lines up |
| `J` | Normal | Join lines (cursor stays in place) |
| `n` / `N` | Normal | Next/prev search result (recentered) |
| `<C-d>` / `<C-u>` | Normal | Half-page jump (recentered) |
| `<leader>p` | Visual | Paste over selection without yanking |
| `<leader>y` | Normal/Visual | Yank to system clipboard |
| `<leader>Y` | Normal | Yank line to system clipboard |
| `<leader>d` | Normal/Visual | Delete to black hole register |
| `<leader>f` | Normal | Format buffer via LSP |
| `<leader>s` | Normal | Substitute word under cursor globally |
| `<leader>x` | Normal | Make current file executable |
| `<leader>ee` | Normal | Insert Go-style error handling snippet |
| `<leader><leader>` | Normal | Source current file |
| `Q` | Normal | Disabled (prevents accidental Ex mode) |
| Arrow keys | Normal | Disabled (use hjkl instead) |

### Quickfix & Location List
| Key | Mode | Action |
|-----|------|--------|
| `<C-k>` | Normal | Next quickfix item |
| `<C-j>` | Normal | Previous quickfix item |
| `<leader>k` | Normal | Next location list item |
| `<leader>j` | Normal | Previous location list item |

### LSP & Diagnostics (buffer-local on attach)
| Key | Action |
|-----|--------|
| `K` | Hover documentation |
| `<leader>k` | Show diagnostics float |
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gi` | Go to implementation |
| `go` | Go to type definition |
| `gr` | Show references |
| `gs` | Signature help |
| `<F2>` | Rename symbol |
| `<F4>` | Code action |

*Note: In LSP-attached buffers, `<leader>k` shows diagnostics. In other buffers, it navigates the location list.*

### Completion (nvim-cmp)
| Key | Mode | Action |
|-----|------|--------|
| `<C-Space>` | Insert | Trigger completion |
| `<C-j>` | Insert | Next completion item |
| `<C-k>` | Insert | Previous completion item |
| `<Tab>` | Insert | Next item or fallback |
| `<S-Tab>` | Insert | Previous item or fallback |
| `<CR>` | Insert | Confirm selection (no auto-select) |
| `<C-b>` | Insert | Scroll docs up |
| `<C-f>` | Insert | Scroll docs down |
| `<C-e>` | Insert | Abort completion |

### Search & Files (Telescope)
| Key | Action |
|-----|--------|
| `<leader>pf` | Find files |
| `<C-p>` | Git-tracked files |
| `<leader>pws` | Grep word under cursor |
| `<leader>pWs` | Grep WORD under cursor |
| `<leader>ps` | Grep with prompt |
| `<leader>vh` | Help tags |

### File Tree
| Key | Action |
|-----|--------|
| `<leader>e` | Toggle nvim-tree |

### Git (Fugitive)
| Key | Context | Action |
|-----|---------|--------|
| `<leader>gs` | Normal | Git status |
| `<leader>p` | Fugitive buffer | Git push |
| `<leader>P` | Fugitive buffer | Git pull --rebase |
| `<leader>t` | Fugitive buffer | Git push -u origin (set upstream) |
| `gu` | Diff view | Take left side (diffget //2) |
| `gh` | Diff view | Take right side (diffget //3) |

### Diagnostics List (Trouble)
| Key | Action |
|-----|--------|
| `<leader>tt` | Toggle Trouble window |
| `[t` | Next diagnostic item and jump |
| `]t` | Previous diagnostic item and jump |

### Testing (neotest)
| Key | Action |
|-----|--------|
| `<leader>tc` | Run nearest test |
| `<leader>tf` | Run tests in current file |

### Documentation (neogen)
| Key | Action |
|-----|--------|
| `<leader>nf` | Generate docstring for function |
| `<leader>nt` | Generate docstring for type |

### Undo & History
| Key | Action |
|-----|--------|
| `<leader>u` | Toggle Undotree |

### LaTeX (Vimtex)
| Feature | Description |
|---------|-------------|
| Auto-compile | Continuous compilation with latexmk (`-pvc` flag) |
| Auto-save | Saves on idle (1 sec) for `.tex` files |
| PDF Viewer | Skim (macOS) with synctex support |
| Warnings | Common warnings filtered (hbox, siunitx, hyperref, etc.) |

| Command | Action |
|---------|--------|
| `:VimtexCompile` | Toggle continuous compilation |
| `:VimtexView` | Open PDF in Skim |
| `:VimtexStop` | Stop compilation |
| `:VimtexClean` | Remove generated files (aux, log, pdf) |
| `:VimtexClean!` | Clean all intermediate files |
| `:VimtexErrors` | Open quickfix with errors/warnings |
| `:VimtexToggleMain` | Switch main document (multi-file projects) |

### Focus / Zen
| Key | Action |
|-----|--------|
| `<leader>zz` | Zen mode (90 cols, keep line numbers) |
| `<leader>zZ` | Zen mode (80 cols, hide numbers & color column) |

### Terminal / Sessions
| Key | Action |
|-----|--------|
| `<C-f>` | Open tmux sessionizer (new tmux window) |

### Fun
| Key | Action |
|-----|--------|
| `<leader>mr` | CellularAutomaton make_it_rain |

---

## Plugins Without Keymaps

| Plugin | Description |
|--------|-------------|
| **Autopairs** | `ultimate-autopair.nvim` — Automatically closes brackets, quotes, etc. |
| **Cloak** | Hides secrets in `.env`, `wrangler.toml`, `.dev.vars` files |
| **Treesitter** | Syntax highlighting and smart indentation for many languages |
| **Fidget** | Shows LSP progress in the corner |
| **LuaSnip** | Snippet engine for completions |
