local theme = require("conf/theme-mocha")

hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 5,
        border_size = 2,
        col = {
            active_border = { colors = { theme.teal, theme.blue }, angle = 45 },
            inactive_border = theme.surface2,
        },
        layout = "dwindle",
    },
    decoration = {
        rounding = 0,
        shadow = {
            enabled = true,
            range = 5,
        },
        blur = {
            enabled = false,
        },
    },
    animations = {
        enabled = true,
    },
    dwindle = {
        preserve_split = true,
        force_split = 2,
        split_width_multiplier = 1.3,
    },
    master = {
        new_on_top = true,
        mfact = 0.5,
    },
    misc = {
        disable_hyprland_logo = true,
    },
    binds = {
        workspace_back_and_forth = true,
        allow_workspace_cycles = true,
    },
})

hl.curve("myBezier", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })
hl.animation({ leaf = "windows", enabled = true, speed = 7, bezier = "myBezier" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 7, bezier = "default", style = "popin 80%" })
hl.animation({ leaf = "border", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 8, bezier = "default" })
hl.animation({ leaf = "fade", enabled = false, speed = 7, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 7, bezier = "default", style = "fade" })
