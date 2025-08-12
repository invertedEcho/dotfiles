#!/run/current-system/sw/bin/python3
import subprocess
import json
import sys


SPLITTED_MONITOR_CMD = "hyprctl keyword monitor".split(" ")
SPLITTED_MOVE_WORKSPACE_CMD = "hyprctl dispatch moveworkspacetomonitor".split(" ")

LAPTOP_MONITOR_NAME = "eDP-1"
TV_MONITOR_NAME = "HDMI-A-1"
TV_MONITOR_DESC = "XXX Beyond TV 0x00010000"


def send_message(msg: str):
    subprocess.run(["notify-send", msg])


def get_all_monitors_output():
    all_monitors_subprocess = subprocess.run(
        ["hyprctl", "monitors", "all", "-j"], capture_output=True, text=True
    )

    if all_monitors_subprocess.returncode != 0:
        subprocess.run(["notify-send", "Failed to run hyprctl to get all monitors."])

    return json.loads(all_monitors_subprocess.stdout)


def get_is_laptop(all_monitors_output):
    return any(monitor["name"] == "eDP-1" for monitor in all_monitors_output)


def setup_monitors(is_laptop: bool):
    if is_laptop:
        subprocess.run(SPLITTED_MONITOR_CMD + [",preferred,auto,1"])
        subprocess.run(SPLITTED_MONITOR_CMD + ["eDP-1,preferred,auto-left,1"])
        send_message("Successfully setup monitors for laptop.")
    else:
        subprocess.run(SPLITTED_MONITOR_CMD + ["DP-2,1920x1080@144.0,auto-left,1"])
        subprocess.run(SPLITTED_MONITOR_CMD + ["DP-3,1920x1200@59.95,auto-right,1"])
        subprocess.run(SPLITTED_MONITOR_CMD + ["HDMI-A-1,disabled"])
        send_message("Successfully setup monitors for Home.")


def main():
    all_monitors_output = get_all_monitors_output()
    is_laptop = get_is_laptop(all_monitors_output=all_monitors_output)

    setup_monitors(is_laptop=is_laptop)


if __name__ == "__main__":
    try:
        main()
    except Exception as e:
        print(e)
        send_message(str(e))
