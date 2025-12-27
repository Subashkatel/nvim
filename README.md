## My Current nvim config

---

### Neovim Keymaps / Commands :

Leader key: `<Space>`

### General Editing
- `<leader>pv` → Open file explorer (Ex)
- `jj` (insert) → Escape to normal
- `J` / `K` (visual) → Move selected lines down/up
- `n` / `N` → Next/prev search result and recenter
- `<C-d>` / `<C-u>` → Half-page jump and recenter
- `<leader>p` (visual) → Paste over without yanking selection
- `<leader>y` / `<leader>Y` → Yank to system clipboard (selection/line)
- `<leader>d` → Delete to blackhole (keeps default register clean)
- `<leader>f` → Format buffer via LSP
- `<leader>s` → Substitute word under cursor across buffer
- `<leader>x` → Make current file executable
- `<leader>ee` → Insert Go-style `if err != nil { … } return err` snippet
- `<leader><leader>` → Source current file
- `<up/down/left/right>` (normal) → Disabled to encourage hjkl

### LSP & Diagnostics (buffer-local on attach)
- `K` → Hover docs
- `<leader>k` → Show diagnostics float
- `gd` / `gD` → Go to definition / declaration
- `gi` / `go` → Go to implementation / type definition
- `gr` → References
- `gs` → Signature help
- `<F2>` → Rename symbol
- `<F4>` → Code action

### Completion (nvim-cmp)
- `<C-Space>` → Trigger completion
- `<C-j>` / `<C-k>` → Next/prev item
- `<Tab>` / `<S-Tab>` → Next/prev item or fallback
- `<CR>` → Confirm selection (no auto-select)
- `<C-b>` / `<C-f>` → Scroll docs

### Search & Files (Telescope)
- `<leader>pf` → Find files
- `<C-p>` → Git-tracked files
- `<leader>pws` → Grep word under cursor
- `<leader>pWs` → Grep WORD under cursor
- `<leader>ps` → Grep with prompt
- `<leader>vh` → Help tags

### File Tree
- `<leader>e` → Toggle nvim-tree

### Git (Fugitive)
- `<leader>gs` → Git status
- `<leader>p` → Git push (from fugitive buffer)
- `<leader>P` → Git pull --rebase (from fugitive buffer)
- `<leader>t` → Git push -u origin … (from fugitive buffer)
- `gu` / `gh` → Take left/right during merge (diffget //2 //3)

### Diagnostics List (Trouble)
- `<leader>tt` → Toggle Trouble
- `[t` / `]t` → Prev/next diagnostic item and jump

### Testing (neotest)
- `<leader>tc` → Run nearest test
- `<leader>tf` → Run tests in current file

### Documentation (neogen)
- `<leader>nf` → Generate docstring for function
- `<leader>nt` → Generate docstring for type

### Undo & History
- `<leader>u` → Toggle Undotree

### LaTeX (Vimtex)
- File auto-compiles continuously with latexmk (`-pvc` flag)
- Auto-saves on idle (1 sec) for .tex files
- PDF viewer: Skim (macOS) with synctex for forward/inverse search
- Common warnings filtered (hbox, siunitx, hyperref, etc.)
- `:VimtexCompile` → Toggle continuous compilation
- `:VimtexView` → Open PDF in Skim
- `:VimtexStop` → Stop compilation
- `:VimtexClean` → Remove generated files (aux, log, pdf)
- `:VimtexClean!` → Clean all intermediate files
- `:VimtexErrors` → Open quickfix list with errors/warnings
- `:VimtexToggleMain` → Switch main document (for multi-file projects)

### Focus / Zen
- `<leader>zz` → Zen mode (90 cols, keep numbers)
- `<leader>zZ` → Zen mode (80 cols, hide numbers/column)

### Terminal / Sessions
- `<C-f>` → Open tmux sessionizer (new tmux window)

### Fun
- `<leader>mr` → CellularAutomaton make_it_rain

### Plugins without keymaps
- Autopairs (ultimate-autopair.nvim) runs automatically on insert
- Cloak hides secrets in .env, wrangler.toml, .dev.vars
- Treesitter provides highlighting/indent; language list in config
- Vimtex configured for LaTeX (Skim viewer, auto-save on idle)
