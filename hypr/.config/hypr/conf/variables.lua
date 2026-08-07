local variables = {
    mod = "SUPER",
    terminal = "kitty",
    menu = "fuzzel --show drun",
    notification = "mako",
    bar = "waybar",
    screenshot = "grim -g \"$(slurp)\" ~/Pictures/$(date +%F_%H-%M-%S).png",
    swappy = "grim -g \"$(slurp)\" - | swappy -f -",
    flameshot = "XDG_CURRENT_DESKTOP=sway flameshot gui",
    onscreen_bar = "bash $HOME/.config/sway/scripts/wob.sh",
    sink_volume = "pactl get-sink-volume @DEFAULT_SINK@ | grep '^Volume:' | cut -d / -f 2 | tr -d ' ' | sed 's/%//'",
    source_volume = "pactl get-source-volume @DEFAULT_SOURCE@ | grep '^Volume:' | cut -d / -f 2 | tr -d ' ' | sed 's/%//'",
    wallpaper = "~/.config/backgrounds/desktop-background",
    brightness_step = "bash -c 'echo $(( $(light -Mr) / 100 * 5 < 1 ? 1 : $(( $(light -Mr) / 100 * 5 )) ))'",
}

variables.volume_down = variables.onscreen_bar .. " $(pactl set-sink-volume @DEFAULT_SINK@ -5% && " .. variables.sink_volume .. ")"
variables.volume_up = variables.onscreen_bar .. " $(pactl set-sink-volume @DEFAULT_SINK@ +5% && " .. variables.sink_volume .. ")"
variables.volume_mute = variables.onscreen_bar .. " $(pactl set-sink-mute @DEFAULT_SINK@ toggle && pactl get-sink-mute @DEFAULT_SINK@ | sed -En \"/no/ s/.*/$(" .. variables.sink_volume .. ")/p; /yes/ s/.*/0/p\")"
variables.mic_mute = variables.onscreen_bar .. " $(pactl set-source-mute @DEFAULT_SOURCE@ toggle && pactl get-source-mute @DEFAULT_SOURCE@ | sed -En \"/no/ s/.*/$(" .. variables.source_volume .. ")/p; /yes/ s/.*/0/p\")"
variables.brightness_up = "light -r -A $(" .. variables.brightness_step .. ") && " .. variables.onscreen_bar .. " $(light -G | cut -d'.' -f1)"
variables.brightness_down = "light -r -U $(" .. variables.brightness_step .. ") && " .. variables.onscreen_bar .. " $(light -G | cut -d'.' -f1)"

return variables
