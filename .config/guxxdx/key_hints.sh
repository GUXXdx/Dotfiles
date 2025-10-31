#!/usr/bin/env bash

if pidof yad > /dev/null; then
    pkill yad
fi

yad --center --title="Keybinding Hints" --no-buttons --list \
    --column=Key: --column="" --column=Description: \
    --timeout-indicator=bottom \
"  =   "          "        "  "SUPER KEY (Windows Key Button)" \
"" "" "" \
"  H"              "        "  "Show keybinding hints" \
"  Enter"          "        "  "Open terminal" \
"" "" "" \
"  D"              "        "  "App launcher" \
"  E"              "        "  "Open file manager" \
"  B"              "        "  "Open browser" \
"  M"              "        "  "Open equidop (discord)" \
"" "" "" \
"  L"              "        "  "Lock screen" \
"  Q"              "        "  "Close active window" \
"  Shift Q"        "        "  "Kill active window by PID" \
"  Shift Ctrl Esc" "        "  "Exit Hyprland" \
"" "" "" \
"  F"              "        "  "Toggle floating" \
"  P"              "        "  "Toggle pseudo (dwindle)" \
"  J"              "        "  "Toggle split (dwindle)" \
"" "" "" \
"  [1 -> 0]"       "        "  "Switch workspace 1-10" \
"  Shift [1 -> 0]" "        "  "Move window to workspace 1-10" \
"" "" "" \
"  W"              "        "  "Choose wallpaper" \
"  Shift W"        "        "  "Random wallpaper" \
"" "" "" \
"  ."              "        "  "Emoji selector" \
"  V"              "        "  "Clipboard manager" \
"  Shift S"        "        "  "Screenshot (region)" \
"" "" "" \
"More Keybinding"   "        "  "$HOME/.config/hypr/conf/keybinding.conf"
