local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- ============================================================
-- Giao diện
-- ============================================================

-- Các scheme khác đã thử: "Catppuccin Mocha", "Tokyo Night", "Ayu Dark (Gogh)"
-- config.color_scheme = "ayu"

-- config.window_background_opacity = 0.9

config.window_padding = {
  left = 8,
  right = 8,
  top = 8,
  bottom = 4,
}

-- Bỏ thanh tiêu đề của WM, chỉ giữ viền để resize
-- config.window_decorations = "RESIZE"

-- ============================================================
-- Font
-- ============================================================

config.font = wezterm.font_with_fallback({
  "JetBrainsMono Nerd Font",
  "Noto Color Emoji",
})
config.font_size = 9.5
config.line_height = 1.1

-- ============================================================
-- Tab bar
-- ============================================================

config.enable_tab_bar = false
-- Luôn hiện tab bar và đặt ở trên: đây là vùng duy nhất có thể kéo để
-- di chuyển cửa sổ, vì window_decorations = "RESIZE" đã bỏ title bar của WM.
config.hide_tab_bar_if_only_one_tab = false
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = false
config.tab_max_width = 32

-- ============================================================
-- Cuộn & hiệu năng
-- ============================================================

config.scrollback_lines = 10000
config.enable_scroll_bar = false
config.animation_fps = 120
config.max_fps = 120
config.front_end = "OpenGL"

config.audible_bell = "Disabled"
config.check_for_updates = false

return config
