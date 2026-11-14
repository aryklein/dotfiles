local menu_process = "fuzzel"

local variables = {
    mod = "SUPER",
    terminal = "ghostty",
    menu_process = menu_process,
    menu = menu_process,
    notification = "mako",
    bar = "waybar",
    screenshot = 'bash "$HOME/.config/hypr/scripts/screenshot.sh" save',
    swappy = 'bash "$HOME/.config/hypr/scripts/screenshot.sh" edit',
    flameshot = "XDG_CURRENT_DESKTOP=sway flameshot gui",
    wallpaper = "~/.config/backgrounds/desktop-background",
}

local controls = 'bash "$HOME/.config/hypr/scripts/hardware-controls.sh" '
variables.volume_down = controls .. "volume-down"
variables.volume_up = controls .. "volume-up"
variables.volume_mute = controls .. "volume-mute"
variables.mic_mute = controls .. "mic-mute"
variables.brightness_up = controls .. "brightness-up"
variables.brightness_down = controls .. "brightness-down"

return variables
