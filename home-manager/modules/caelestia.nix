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
            "compact": true
        },
        "clock": {
            "background": true,
            "showDate": false,
            "showIcon": false
        },
        "persistent": true,
        "status": {
            "showAudio": false,
            "showKbLayout": true,
            "showLockStatus": false,
            "showMicrophone": true
        },
        "tray": {
            "background": true,
            "compact": true,
            "recolour": true
        },
        "workspaces": {
            "activeIndicator": true,
            "occupiedBg": false
        }
    },
    "border": {
        "rounding": 0,
        "thickness": 0
    },
    "dashboard": {
        "showWeather": false
    },
    "services": {
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

  # Per-monitor override from your current tree.
  xdg.configFile."caelestia/monitors/eDP-1/shell.json".text = ''
{ }
'';
}
