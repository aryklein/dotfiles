# Hyprland configuration

## Maintained entrypoint

**Edit `hyprland.lua` and `conf/*.lua`.** This is the maintained configuration,
validated with Hyprland **0.56.2**. The deployed entrypoint is
`~/.config/hypr/hyprland.lua` (or `$XDG_CONFIG_HOME/hypr/hyprland.lua`).

`hyprland.lua` loads the environment, monitors, autostart, input, appearance,
window rules, and keybindings. Shared commands live in `conf/variables.lua`;
monitor settings used at startup and by toggle bindings live in
`conf/monitor-profiles.lua`. Helper scripts live in `scripts/`.

## Legacy Hyprland files

`hyprland.conf`, `conf/*.conf`, and `theme-mocha.conf` are retained as legacy
reference files. They are **not maintained or synchronized with the Lua config**.
Make current Hyprland changes in Lua, and do not explicitly launch the current
setup with `--config` pointing to `hyprland.conf`.

The legacy files can be removed once any external session launchers or scripts
that explicitly select them have been retired.

## Companion configurations

These `.conf` files remain maintained in their respective applications' syntax;
they are not legacy Hyprland modules:

- `hypridle.conf`: idle actions and lock timing.
- `hyprlock.conf`: lock screen appearance.
- `hyprpaper.conf`: wallpapers.
- `xdph.conf`: xdg-desktop-portal-hyprland settings.

## Validate and apply

From this directory, validate without reloading the running desktop:

```sh
Hyprland --verify-config --config "$PWD/hyprland.lua"
```

To apply the deployed configuration when ready (including monitor settings):

```sh
hyprctl reload
hyprctl configerrors
```

The upstream wiki's default view tracks latest Git and can be newer than the
installed release. Check the installed version with `Hyprland --version` and
use `/usr/share/hypr/stubs/hl.meta.lua` as a local Lua API reference.
