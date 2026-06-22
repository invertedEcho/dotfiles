#!/usr/bin/python3

import subprocess
import json
import socket

EXTERNAL_MONITOR = "HDMI-A-1"
LAPTOP_MONITOR = "eDP-1"

all_monitors_output_subprocess = subprocess.run(
    ["hyprctl", "monitors", "all", "-j"], capture_output=True, text=True
)
all_monitors_output_json = json.loads(all_monitors_output_subprocess.stdout)

host_name = socket.gethostname()

monitor_name = LAPTOP_MONITOR if host_name == "jakob-thinkpad" else EXTERNAL_MONITOR

try:
    filtered_monitor = next(
        filter(
            lambda monitor: monitor["name"] == monitor_name, all_monitors_output_json
        )
    )

    is_external_monitor_disabled = filtered_monitor["disabled"]

    splitted_monitor_cmd = f"hyprctl dispatch hl.monitor({{output='{monitor_name}',disabled={str(not is_external_monitor_disabled).lower()}}})".split(" ")
    print(splitted_monitor_cmd)

    if is_external_monitor_disabled:
        subprocess.run(splitted_monitor_cmd)
        subprocess.run(["notify-send", f"Enabled {monitor_name} monitor"])
    else:
        subprocess.run(splitted_monitor_cmd)
        subprocess.run(["notify-send", f"Disabled {monitor_name} monitor"])
except:
    subprocess.run(["notify-send", f"{EXTERNAL_MONITOR} doesn't seem to be available."])
