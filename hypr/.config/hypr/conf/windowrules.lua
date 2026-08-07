hl.window_rule({
    name = "floating-shell",
    float = true,
    size = { "monitor_w*0.5", "monitor_h*0.7" },
    center = true,
    match = { class = "^(floating_shell)$" },
})

hl.window_rule({
    name = "file-picker-size",
    float = true,
    size = { "monitor_w*0.6", "monitor_h*0.9" },
    match = { title = "(Open Files|Save File)" },
})

hl.window_rule({
    name = "open-files-center",
    center = true,
    match = { title = "Open Files" },
})

hl.window_rule({
    name = "google-meet-workspace",
    workspace = "10 silent",
    match = { initial_title = "(Meet - .*)" },
})
