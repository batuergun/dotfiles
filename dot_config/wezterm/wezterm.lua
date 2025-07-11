local wezterm = require("wezterm")

return {
  audible_bell = "Disabled",
  front_end = "WebGpu",
  term = "xterm-256color",
  use_fancy_tab_bar = false,
  tab_bar_at_bottom = true,
  show_tab_index_in_tab_bar = true,
  tab_max_width = 25,
  switch_to_last_active_tab_when_closing_tab = true,
  window_padding = { left = 1, right = 1, top = 1, bottom = 1 },
  window_decorations = "RESIZE",
  window_background_opacity = 1,
  inactive_pane_hsb = {
    saturation = 1,
    brightness = 1,
  },
  default_cursor_style = "SteadyBar",
  font = wezterm.font_with_fallback({
    -- "Pragmasevka Nerd Font",
    -- "Martian Mono Cn Lt",
    -- "Iosevka Nerd Font",
    -- "Martian Mono Nr Lt",
    "JetBrainsMono Nerd Font",
  }),
  font_size = 14,
  -- line_height = 1.10,
  harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
  
  -- Make Option key work as Meta key (for tmux Option+a prefix)
  send_composed_key_when_right_alt_is_pressed = false,
  
  leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 },
  keys = {
    {
      key = "|",
      mods = "LEADER",
      action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
    },
    {
      key = "-",
      mods = "LEADER",
      action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
    },
    {
      key = "h",
      mods = "LEADER",
      action = wezterm.action.ActivatePaneDirection("Left"),
    },
    {
      key = "j",
      mods = "LEADER",
      action = wezterm.action.ActivatePaneDirection("Down"),
    },
    {
      key = "k",
      mods = "LEADER",
      action = wezterm.action.ActivatePaneDirection("Up"),
    },
    {
      key = "l",
      mods = "LEADER",
      action = wezterm.action.ActivatePaneDirection("Right"),
    },
    {
      key = "s",
      mods = "LEADER",
      action = wezterm.action.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }),
    },
    {
      key = "p",
      mods = "LEADER",
      action = wezterm.action.ShowLauncherArgs({ flags = "FUZZY|COMMANDS" }),
    },
    { key = "z", mods = "LEADER", action = "TogglePaneZoomState" },
    -- Send "CTRL-A" to the terminal when pressing CTRL-A, CTRL-A
    {
      key = "a",
      mods = "LEADER|CTRL",
      action = wezterm.action.SendString("\x01"),
    },
    {
      key = 'I',
      mods = 'CMD',
      action = wezterm.action.ClearScrollback 'ScrollbackAndViewport',
    },
  },
  color_scheme = "bleeding-purple",
}
