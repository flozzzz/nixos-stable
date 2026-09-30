{ ... }:

{
  xdg.configFile."caelestia/shell.json".text = ''
{
    "appearance": {
        "rounding": {
            "scale": 0.9642359661936563
        },
        "transparency": {
            "base": 0.2462959098497496,
            "enabled": true,
            "layers": 0.4950014346828047
        }
    },
    "border": {
        "rounding": 0,
        "thickness": 0
    },
    "background": {
        "desktopClock": {
            "background": {
                "enabled": false
            },
            "enabled": true,
            "position": "top-right"
        }
    },
    "bar": {
        "activeWindow": {
            "compact": true,
            "inverted": false,
            "showOnHover": true
        },
        "clock": {
            "showIcon": false
        },
        "statusIcons": [
            {
                "enabled": true,
                "id": "network"
            },
            {
                "enabled": true,
                "id": "bluetooth"
            },
            {
                "enabled": true,
                "id": "kbLayout"
            },
            {
                "enabled": false,
                "id": "microphone"
            },
            {
                "enabled": false,
                "id": "lockStatus"
            },
            {
                "enabled": false,
                "id": "audio"
            },
            {
                "enabled": true,
                "id": "battery"
            }
        ],
        "tray": {
            "background": true,
            "compact": true,
            "recolour": false
        }
    },
    "dashboard": {
        "enabled": true,
        "performance": {
            "showBattery": true,
            "showCpu": true,
            "showGpu": true
        }
    },
    "general": {
        "apps": {
            "explorer": [
                "dolphin"
            ],
            "terminal": [
                "kitty"
            ]
        }
    },
    "services": {
        "clockFormat": "TwentyFourHour",
        "maxVolume": 2
    },
    "utilities": {
        "toasts": {
            "capsLockChanged": false,
            "kbLayoutChanged": false
        }
    }
}
'';
}

