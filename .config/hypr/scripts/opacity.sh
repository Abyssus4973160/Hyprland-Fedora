#!/bin/bash

# Script: toggle_opacity.sh

ACTIVE_WIN=$(hyprctl activewindow -j | jq -r '.address')
CURRENT_OPACITY=$(hyprctl getoption decoration:active_opacity | grep float | awk '{print $2}')

if [[ "$CURRENT_OPACITY" == "1.000000" ]]; then
    hyprctl keyword decoration:active_opacity 0.70
    hyprctl keyword decoration:inactive_opacity 0.50
else
    hyprctl keyword decoration:active_opacity 1.0
    hyprctl keyword decoration:inactive_opacity 1.0
fi

# if [[ "$CURRENT_OPACITY" == "1.000000" ]]; then
#    hyprctl keyword decoration:active_opacity 0.92
#    hyprctl keyword decoration:inactive_opacity 0.70
# else
#     hyprctl keyword decoration:active_opacity 1.0
#     hyprctl keyword decoration:inactive_opacity 1.0
# fi