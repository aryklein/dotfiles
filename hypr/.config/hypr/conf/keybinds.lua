local programs = require("conf/variables")
local mod = programs.mod

hl.bind(mod .. " + RETURN", hl.dsp.exec_cmd(programs.terminal))
hl.bind(mod .. " + SHIFT + q", hl.dsp.window.close())
hl.bind(mod .. " + SHIFT + e", hl.dsp.exit())
hl.bind(mod .. " + SHIFT + RETURN", hl.dsp.exec_cmd("brave"))
hl.bind(mod .. " + SPACE", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mod .. " + d", hl.dsp.exec_cmd("killall " .. programs.menu .. " 2>/dev/null; " .. programs.menu))
hl.bind(mod .. " + s", hl.dsp.layout("togglesplit"))
hl.bind(mod .. " + f", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind(mod .. " + ESCAPE", hl.dsp.focus({ workspace = "previous" }))
hl.bind(mod .. " + v", hl.dsp.exec_cmd("killall fuzzel 2>/dev/null; cliphist list | fuzzel --dmenu --with-nth 2 | cliphist decode | wl-copy"))
hl.bind(mod .. " + SHIFT + p", hl.dsp.exec_cmd(programs.screenshot))
hl.bind(mod .. " + p", hl.dsp.exec_cmd(programs.swappy))

hl.bind(mod .. " + l", hl.dsp.focus({ direction = "right" }))
hl.bind(mod .. " + h", hl.dsp.focus({ direction = "left" }))
hl.bind(mod .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(mod .. " + j", hl.dsp.focus({ direction = "down" }))

for i = 1, 10 do
    local key = i % 10
    hl.bind(mod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i, follow = false }))
end

hl.bind(mod .. " + TAB", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mod .. " + SHIFT + TAB", hl.dsp.focus({ workspace = "e-1" }))

hl.bind(mod .. " + SHIFT + l", hl.dsp.window.move({ direction = "right" }))
hl.bind(mod .. " + SHIFT + h", hl.dsp.window.move({ direction = "left" }))
hl.bind(mod .. " + SHIFT + k", hl.dsp.window.move({ direction = "up" }))
hl.bind(mod .. " + SHIFT + j", hl.dsp.window.move({ direction = "down" }))

hl.bind("CTRL + ALT + l", hl.dsp.exec_cmd("loginctl lock-session"))

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(programs.volume_up), { repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(programs.volume_down), { repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(programs.volume_mute))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(programs.brightness_up), { locked = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(programs.brightness_down), { locked = true })

hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind(mod .. " + r", hl.dsp.submap("resize"))
hl.define_submap("resize", function()
    hl.bind("h", hl.dsp.window.resize({ x = -15, y = 0, relative = true }), { repeating = true })
    hl.bind("l", hl.dsp.window.resize({ x = 15, y = 0, relative = true }), { repeating = true })
    hl.bind("k", hl.dsp.window.resize({ x = 0, y = -15, relative = true }), { repeating = true })
    hl.bind("j", hl.dsp.window.resize({ x = 0, y = 15, relative = true }), { repeating = true })
    hl.bind("ESCAPE", hl.dsp.submap("reset"))
    hl.bind(mod .. " + r", hl.dsp.submap("reset"))
end)

local function toggle_monitor(output, enabled_config)
    if hl.get_monitor(output) then
        hl.monitor({ output = output, disabled = true })
    else
        hl.monitor(enabled_config)
    end
end

local laptop_monitor = {
    output = "eDP-1",
    mode = "preferred",
    position = "2560x0",
    scale = 1,
    disabled = false,
}

hl.bind("switch:on:Lid Switch", function()
    hl.monitor({ output = "eDP-1", disabled = true })
end, { locked = true })

hl.bind("switch:off:Lid Switch", function()
    hl.monitor(laptop_monitor)
end, { locked = true })

hl.bind("SUPER + minus", function()
    toggle_monitor("eDP-1", laptop_monitor)
end)

hl.bind("SUPER + equal", function()
    toggle_monitor("HDMI-A-1", {
        output = "HDMI-A-1",
        mode = "preferred",
        position = "-1080x-550",
        scale = 1,
        transform = 3,
        disabled = false,
    })
end)
