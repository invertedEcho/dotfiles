#!/usr/bin/python3

import subprocess
import json

MONITOR_NAME = "HDMI-A-1"
SPLITTED_MONITOR_CMD = "hyprctl keyword monitor".split(" ")

all_monitors_output_subprocess = subprocess.run(
    ["hyprctl", "monitors", "all", "-j"], capture_output=True, text=True
)
all_monitors_output_json = json.loads(all_monitors_output_subprocess.stdout)
filtered_monitor = next(
    filter(lambda monitor: monitor["name"] == MONITOR_NAME, all_monitors_output_json)
)

is_external_monitor_disabled = filtered_monitor["disabled"] is True

if is_external_monitor_disabled:
    subprocess.run(SPLITTED_MONITOR_CMD + [f"{MONITOR_NAME},preferred,auto,2"])
    subprocess.run(["notify-send", "Enabled external monitor"])
else:
    subprocess.run(SPLITTED_MONITOR_CMD + [f"{MONITOR_NAME},disable"])
    subprocess.run(["notify-send", "Disabled external monitor"])
