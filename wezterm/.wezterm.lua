local wezterm = require 'wezterm'

return {
  -- Đặt font chữ
  font = wezterm.font_with_fallback {
    "JetBrains Mono",
  },

  -- Đặt kích thước font
  font_size = 11.0,

  -- Đặt màu sắc nền và chữ dựa trên Gruvbox Dark
  colors = {
    foreground = "#ebdbb2",  -- Màu chữ chính
    background = "#282828",  -- Màu nền chính
    cursor_bg = "#ebdbb2",   -- Màu nền con trỏ
    cursor_border = "#ebdbb2",  -- Màu viền con trỏ
    cursor_fg = "#282828",   -- Màu chữ con trỏ
    selection_bg = "#504945",  -- Màu nền vùng chọn
    selection_fg = "#ebdbb2",  -- Màu chữ vùng chọn

    -- Đặt màu cho các chế độ thông thường và sáng
    ansi = {"#282828", "#cc241d", "#98971a", "#d79921", "#458588", "#b16286", "#689d6a", "#a89984"},
    brights = {"#928374", "#fb4934", "#b8bb26", "#fabd2f", "#83a598", "#d3869b", "#8ec07c", "#ebdbb2"},
  },

  -- Đặt giao diện trong suốt (transparency)
  window_background_opacity = 0.92,

  -- -- Đặt hình nền (nếu có)
  -- background = {
  --   {
  --     source = {
  --       File = "/home/snsar/Downloads/wallhaven1.png",  -- Đảm bảo đường dẫn tới hình ảnh đúng
  --     },
  --     opacity = 0.9,
  --     hsb = { brightness = 0.05, hue = 1.0, saturation = 1.0 },
  --   },
  -- },

  -- Tùy chỉnh thanh tiêu đề (tab bar)
  hide_tab_bar_if_only_one_tab = true,

  -- Đặt khóa tùy chỉnh (key bindings)
  keys = {
    -- Đóng tab hiện tại bằng Ctrl+w
    {key="w", mods="CTRL", action=wezterm.action{CloseCurrentPane={confirm=true}}},
    -- Mở tab mới bằng Ctrl+t
    {key="t", mods="CTRL", action=wezterm.action{SpawnTab="DefaultDomain"}},
    -- Chuyển đổi giữa các tab bằng Alt+Left/Right
    {key="LeftArrow", mods="ALT", action=wezterm.action{ActivateTabRelative=-1}},
    {key="RightArrow", mods="ALT", action=wezterm.action{ActivateTabRelative=1}},
  },

  -- Đặt điều chỉnh hiển thị (tùy chọn)
  adjust_window_size_when_changing_font_size = false,
}

