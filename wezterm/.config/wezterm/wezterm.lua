
local wezterm = require("wezterm")
local config = {}

config.color_scheme = "GruvboxDark"
config.enable_tab_bar = false

-- Đặt hình nền (nếu muốn)
config.window_background_image = "/home/snsar/Downloads/flower.png"
config.window_background_image_hsb = { brightness = 0.05, hue = 1.0, saturation = 1.0 }

-- Điều chỉnh opacity cho cửa sổ
config.window_background_opacity = 0.9
config.text_background_opacity = 0.5

return config