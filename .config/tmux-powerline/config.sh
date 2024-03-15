# Default configuration file for tmux-powerline.
# Modeline {
#	 vi: foldmarker={,} foldmethod=marker foldlevel=0 tabstop=4 filetype=sh
# }
#

# General {
# Show which segment fails and its exit code.
export TMUX_POWERLINE_DEBUG_MODE_ENABLED="false"
# Use patched font symbols.
export TMUX_POWERLINE_PATCHED_FONT_IN_USE="true"

# The theme to use.
export TMUX_POWERLINE_THEME="fugu"
# Overlay directory to look for themes. There you can put your own themes outside the repo. Fallback will still be the "themes" directory in the repo.
export TMUX_POWERLINE_DIR_USER_THEMES="${XDG_CONFIG_HOME:-$HOME/.config}/tmux-powerline/themes"
# Overlay directory to look for segments. There you can put your own segments outside the repo. Fallback will still be the "segments" directory in the repo.
export TMUX_POWERLINE_DIR_USER_SEGMENTS="${XDG_CONFIG_HOME:-$HOME/.config}/tmux-powerline/segments"

# The initial visibility of the status bar. Can be {"on, off"}.
export TMUX_POWERLINE_STATUS_VISIBILITY="on"
# The status bar refresh interval in seconds.
# Note that events that force-refresh the status bar (such as window renaming) will ignore this.
export TMUX_POWERLINE_STATUS_INTERVAL="1"
# The location of the window list. Can be {"absolute-centre, centre, left, right"}.
# Note that "absolute-centre" is only supported on `tmux -V` >= 3.2.
export TMUX_POWERLINE_STATUS_JUSTIFICATION="centre"

# The maximum length of the left status bar.
export TMUX_POWERLINE_STATUS_LEFT_LENGTH="60"
# The maximum length of the right status bar.
export TMUX_POWERLINE_STATUS_RIGHT_LENGTH="90"

# The separator to use between windows on the status bar.
export TMUX_POWERLINE_WINDOW_STATUS_SEPARATOR=""

# Uncomment these if you want to enable tmux bindings for muting (hiding) one of the status bars.
# E.g. this example binding would mute the left status bar when pressing <prefix> followed by Ctrl-[
#export TMUX_POWERLINE_MUTE_LEFT_KEYBINDING="C-["
#export TMUX_POWERLINE_MUTE_RIGHT_KEYBINDING="C-]"
# }

# air.s
# battery.sh {
# How to display battery remaining. Can be {percentage, cute}.
export TMUX_POWERLINE_SEG_BATTERY_TYPE="percentage"
# How may hearts to show if cute indicators are used.
export TMUX_POWERLINE_SEG_BATTERY_NUM_HEARTS="5"
# }

# date.sh {
# date(1) format for the date. If you don't, for some reason, like ISO 8601 format you might want to have "%D" or "%m/%d/%Y".
export TMUX_POWERLINE_SEG_DATE_FORMAT="%F"
# }

# gcalcli.sh {
# gcalcli uses 24hr time format by default - if you want to see 12hr time format, set TMUX_POWERLINE_SEG_GCALCLI_MILITARY_TIME_DEFAULT to 0
export TMUX_POWERLINE_SEG_GCALCLI_24HR_TIME_FORMAT="1"
# }

# hostname.sh {
# Use short or long format for the hostname. Can be {"short, long"}.
export TMUX_POWERLINE_SEG_HOSTNAME_FORMAT="short"
# }

# mode_indicator.sh {
# Whether the normal & prefix mode section should be enabled. Should be {"true, "false"}.
export TMUX_POWERLINE_SEG_MODE_INDICATOR_NORMAL_AND_PREFIX_MODE_ENABLED="true"
# Normal mode text & color overrides. Defaults to "normal" & the segment foreground color set in the theme used.
export TMUX_POWERLINE_SEG_MODE_INDICATOR_NORMAL_MODE_TEXT="normal"
export TMUX_POWERLINE_SEG_MODE_INDICATOR_NORMAL_MODE_TEXT_COLOR=""
# Prefix mode text & color overrides. Defaults to "prefix" & the segment foreground color set in the theme used.
export TMUX_POWERLINE_SEG_MODE_INDICATOR_PREFIX_MODE_TEXT="prefix"
export TMUX_POWERLINE_SEG_MODE_INDICATOR_PREFIX_MODE_TEXT_COLOR=""
# Whether the mouse mode section should be enabled. Should be {"true, "false"}.
export TMUX_POWERLINE_SEG_MODE_INDICATOR_MOUSE_MODE_ENABLED="true"
# Mouse mode text & color overrides. Defaults to "mouse" & the segment foreground color set in the theme used.
export TMUX_POWERLINE_SEG_MODE_INDICATOR_MOUSE_MODE_TEXT="mouse"
export TMUX_POWERLINE_SEG_MODE_INDICATOR_MOUSE_MODE_TEXT_COLOR=""
# Whether the copy mode section should be enabled. Should be {"true, "false"}.
export TMUX_POWERLINE_SEG_MODE_INDICATOR_COPY_MODE_ENABLED="true"
# Copy mode text & color overrides. Defaults to "copy" & the segment foreground color set in the theme used.
export TMUX_POWERLINE_SEG_MODE_INDICATOR_COPY_MODE_TEXT="copy"
export TMUX_POWERLINE_SEG_MODE_INDICATOR_COPY_MODE_TEXT_COLOR=""
# Separator text override. Defaults to " • ".
export TMUX_POWERLINE_SEG_MODE_INDICATOR_SEPARATOR_TEXT=" • "
# }

# pwd.sh {
# Maximum length of output.
export TMUX_POWERLINE_SEG_PWD_MAX_LEN="40"
# }

# time.sh {
# date(1) format for the time. Americans might want to have "%I:%M %p".
export TMUX_POWERLINE_SEG_TIME_FORMAT="%H:%M"
# Change this to display a different timezone than the system default.
# Use TZ Identifier like "America/Los_Angeles"
export TMUX_POWERLINE_SEG_TIME_TZ=""
# }

# tmux_session_info.sh {
# Session info format to feed into the command: tmux display-message -p
# For example, if FORMAT is '[ #S ]', the command is: tmux display-message -p '[ #S ]'
# export TMUX_POWERLINE_SEG_TMUX_SESSION_INFO_FORMAT="#S:#I.#P"
export TMUX_POWERLINE_SEG_TMUX_SESSION_INFO_FORMAT="Window:#I"
# }

# vcs_branch.sh {
# Max length of the branch name.
export TMUX_POWERLINE_SEG_VCS_BRANCH_MAX_LEN="24"
# }

# xkb_layout.sh {
# Keyboard icon
export TMUX_POWERLINE_SEG_XKB_LAYOUT_ICON="⌨ "
# }
