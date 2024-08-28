local wezterm = require 'wezterm'

return {
  -- Đặt font chữ
  font = wezterm.font_with_fallback {
    "JetBrains Mono",
  },
  
  -- Đặt kích thước font
  font_size = 10.0,

  -- Đặt màu sắc nền và chữ
  colors = {
    foreground = "#c0caf5",
    background = "#1a1b26",
    cursor_bg = "#c0caf5",
    cursor_border = "#c0caf5",
    cursor_fg = "#1a1b26",
    selection_bg = "#33467C",
    selection_fg = "#c0caf5",

    -- Đặt màu cho các chế độ thông thường, đậm và mờ
    ansi = {"#15161e", "#f7768e", "#9ece6a", "#e0af68", "#7aa2f7", "#bb9af7", "#7dcfff", "#a9b1d6"},
    brights = {"#414868", "#f7768e", "#9ece6a", "#e0af68", "#7aa2f7", "#bb9af7", "#7dcfff", "#c0caf5"},
  },

  -- Đặt giao diện trong suốt (transparency)
  window_background_opacity = 0.92,

  -- -- Đặt hình nền (nếu có)
  -- background = {
  --   {
  --     source = {
  --       File = "/home/snsar/Downloads/wallhaven.png",  -- Đảm bảo đường dẫn tới hình ảnh đúng
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

