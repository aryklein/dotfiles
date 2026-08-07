hl.config({
    input = {
        kb_layout = "us",
        kb_variant = "altgr-intl",
        kb_model = "",
        kb_rules = "",
        repeat_delay = 600,
        repeat_rate = 35,
        follow_mouse = 1,
        touchpad = {
            natural_scroll = true,
        },
        sensitivity = 0,
    },
})

hl.device({
    name = "kensington-expert-wireless-tb-mouse",
    accel_profile = "adaptive",
    scroll_method = "on_button_down",
    scroll_button = 275,
})

hl.device({
    name = "logitech-usb-receiver-mouse",
    sensitivity = -0.4,
})
