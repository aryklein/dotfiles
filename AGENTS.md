# Repository Instructions

## Repo Shape
- This is a GNU Stow dotfiles repo. Top-level directories are Stow packages whose contents mirror paths under `$HOME`.
- `dotfiles.sh` is the only root automation found; there is no root package manifest, Makefile, CI workflow, pre-commit config, or repo-wide lint/test command.
- `dotfiles.sh install` and `dotfiles.sh clean` operate on the script's hard-coded package list, not every top-level directory. Notable top-level dirs absent from that list include `cursor`, `kanshi`, `sway`, `swaylock`, `vscode`, and `zoom`.

## Commands
- Deploy all scripted packages: `./dotfiles.sh install`.
- Remove all scripted Stow links: `./dotfiles.sh clean`.
- Preview a single package before linking: `stow -nv -t "$HOME" <package>`.
- Link a single package: `stow -v -t "$HOME" <package>`.
- Unlink a single package: `stow -v -D -t "$HOME" <package>`.

## Stow Safety
- `dotfiles.sh install` deletes existing conflicting regular files or symlinks under `$HOME` before re-stowing packages. Do not run it casually as a verification step.
- The script exits when run as root; keep install/clean commands as the target user.

## Neovim Notes
- Neovim starts at `nvim/.config/nvim/init.lua`, which loads `lua/ary/init.lua`; plugin specs live under `lua/ary/plugins/` via `lazy.nvim`.
- `lazy.nvim` is bootstrapped at runtime into Neovim's data directory, not vendored in this repo.
- `.gitignore` excludes `nvim/.config/nvim/plugin/` and `nvim/.config/nvim/lazy-lock.json`; treat those as generated/local state even if present in the worktree.
- Configured Neovim formatters/linters are documented in `conform.lua` and `nvim-lint.lua`: `shfmt`, `stylua`, `prettier`, `yamlfmt`, `ruff_format`, `goimports`, `terraform_fmt`, plus linting with `shellcheck`, `ruff`, `yamllint`, and `ansible_lint` when installed.

## OpenCode Config
- Repo-local OpenCode config is stowed from `opencode/.config/opencode/opencode.json` to `~/.config/opencode/opencode.json`.
- That file references `TAVILY_API_KEY`, `LITELLM_BASE_URL`, and `LITELLM_API_KEY` via environment substitution; do not hard-code secrets.
- The file currently uses JSON-with-comments-style trailing commas despite the `.json` extension, so strict JSON tools like `jq` may fail on it.
