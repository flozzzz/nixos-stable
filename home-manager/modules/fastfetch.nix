{ ... }:

{
  xdg.configFile."fastfetch/config.jsonc".text = ''
{
  "$schema": "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json",

  "logo": {
    "type": "builtin",
    "source": "nixos_small",
    "padding": {
      "top": 1,
      "left": 1
    }
  },

  "display": {
    "separator": " ",
    "color": {
      "keys": "cyan",
      "title": "white"
    }
  },

  "modules": [
    {
      "type": "custom",
      "format": "┌───────────  system ───────────┐"
    },

    {
      "type": "os",
      "key": " OS"
    },
    {
      "type": "kernel",
      "key": "󰌢 Kernel"
    },
    {
      "type": "uptime",
      "key": "󰅐 Uptime"
    },

    {
      "type": "custom",
      "format": "├───────────  session ──────────┤"
    },

    {
      "type": "wm",
      "key": "󰖯 WM"
    },
    {
      "type": "terminal",
      "key": " Terminal"
    },
    {
      "type": "shell",
      "key": "󰆍 Shell"
    },

    {
      "type": "custom",
      "format": "├───────────  hardware ─────────┤"
    },

    {
      "type": "cpu",
      "key": "󰍛 CPU"
    },
    {
      "type": "gpu",
      "key": "󰍹 GPU"
    },
    {
      "type": "memory",
      "key": "󰑭 RAM"
    },

    {
      "type": "custom",
      "format": "└────────────────────────────────┘"
    }
  ]
}
'';
}
