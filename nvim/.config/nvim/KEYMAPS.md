# Neovim Shortcuts

## Window Management

| Shortcut | Mode | Description |
|----------|------|-------------|
| `<C-j>` | Normal | Resize window down (-3) |
| `<C-k>` | Normal | Resize window up (+3) |
| `<C-l>` | Normal | Resize window right (-3) |
| `<C-h>` | Normal | Resize window left (+3) |

## Terminal

| Shortcut | Mode | Description |
|----------|------|-------------|
| `<Leader>ht` | Normal | Open horizontal terminal split |
| `<Leader>vt` | Normal | Open vertical terminal split |
| `<Esc>` | Terminal | Exit terminal mode to normal mode |


## Search & Navigation

| Shortcut | Mode | Description |
|----------|------|-------------|
| `<Leader>h` | Normal | Remove search highlighting |
| `<C-d>` | Normal | Half page down (centered) |
| `<C-u>` | Normal | Half page up (centered) |
| `n` | Normal | Next search result (centered) |
| `N` | Normal | Previous search result (centered) |
| `<Leader>s` | Normal | Word substitution helper |

## Text Editing

| Shortcut | Mode | Description |
|----------|------|-------------|
| `J` | Visual | Move selected block down |
| `K` | Visual | Move selected block up |
| `>` | Visual | Indent block (stay in visual mode) |
| `<` | Visual | Outdent block (stay in visual mode) |
| `<Leader>p` | Visual | Paste without losing buffer |

## Code Commenting (Built-in)

| Shortcut | Mode | Description |
|----------|------|-------------|
| `gcc` | Normal | Toggle comment on current line |
| `gc` + motion | Normal | Comment with motion (e.g., `gcap` for paragraph) |
| `gc` | Visual | Comment/uncomment selection |
| `gbc` | Normal | Toggle block comment on current line |
| `gb` + motion | Normal | Block comment with motion |

## Git Integration

| Shortcut | Mode | Description |
|----------|------|-------------|
| `<Leader>gh` | Normal | Preview git hunk |
| `<Leader>hb` | Normal | Show git blame for current line |
| `<Leader>tb` | Normal | Toggle git blame for current line (follows cursor) |

## Telescope (Fuzzy Finder)

| Shortcut | Mode | Description |
|----------|------|-------------|
| `<Leader>ff` | Normal | Find files |
| `<Leader>fg` | Normal | Live grep (search in files) |
| `<Leader>fb` | Normal | List buffers |
| `<Leader>fh` | Normal | Help tags |
| `<Leader>fe` | Normal | File browser |

## Copilot AI

| Shortcut | Mode | Description |
|----------|------|-------------|
| `<M-l>` | Insert | Accept Copilot suggestion |
| `<M-]>` | Insert | Next Copilot suggestion |
| `<M-[>` | Insert | Previous Copilot suggestion |
| `<C-]>` | Insert | Dismiss Copilot suggestion |
| `<M-CR>` | Normal | Open Copilot panel |
| `<Leader>cc` | Normal | Toggle Copilot Chat |

### Copilot Panel (when open)

| Shortcut | Mode | Description |
|----------|------|-------------|
| `[[` | Normal | Jump to previous suggestion |
| `]]` | Normal | Jump to next suggestion |
| `<CR>` | Normal | Accept suggestion |
| `gr` | Normal | Refresh suggestions |

## Autocompletion (Blink)

| Shortcut | Mode | Description |
|----------|------|-------------|
| `<Tab>` | Insert | Accept completion (super-tab preset) |
| `<C-Space>` | Insert | Open completion menu or docs |
| `<C-n>` / `<Down>` | Insert | Select next item |
| `<C-p>` / `<Up>` | Insert | Select previous item |
| `<C-e>` | Insert | Hide completion menu |
| `<C-k>` | Insert | Toggle signature help |

## Notes

- `<Leader>` key is typically mapped to space or backslash (check your leader key setting)
- `<M->` refers to Alt/Meta key
- `<C->` refers to Ctrl key
- All shortcuts are case-sensitive
