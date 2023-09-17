local wezterm = require("wezterm")

return {
  color_scheme = "tokyonight",
  default_cursor_style = "BlinkingUnderline",
  hide_tab_bar_if_only_one_tab = true,
  scrollback_lines = 5000,
  warn_about_missing_glyphs = false,
  font = wezterm.font("Iosevka Nerd Font", {weight="Medium", stretch="Normal", style="Normal"}),
  font_size = 18,
  keys = {
    -- Make Option-Left equivalent to Alt-b which many line editors interpret as backward-word
    {key="LeftArrow", mods="OPT", action=wezterm.action{SendString="\x1bb"}},
    -- Make Option-Right equivalent to Alt-f; forward-word
    {key="RightArrow", mods="OPT", action=wezterm.action{SendString="\x1bf"}},
  }
}
