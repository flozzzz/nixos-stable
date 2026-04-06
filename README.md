# NixOS Config

This is my personal NixOS configuration.

It includes:
- system modules
- Home Manager setup
- Hyprland configuration
- application configs
- machine-specific settings

---

## Installation

### Fresh install or existing system

```bash
cd /etc/nixos
sudo mv /etc/nixos /etc/nixos.backup
sudo git clone https://github.com/flozzzz/nixos-stable /etc/nixos
cd /etc/nixos
sudo nixos-rebuild switch --flake .#flozz-nixos
````

> Replace `flozz-nixos` with your system hostname if needed.

---

## Notes

Before rebuilding, make sure:

* `hardware-configuration.nix` is present
* your hostname in `flake.nix` matches the one you use in the rebuild command
* you have your own machine-specific settings if needed

If something goes wrong, you can restore the backup:

```bash
sudo rm -rf /etc/nixos
sudo mv /etc/nixos.backup /etc/nixos
```

---

## Structure

* `configuration.nix` — main system config
* `hardware-configuration.nix` — hardware-specific settings
* `modules/` — system modules
* `home-manager/` — Home Manager configs and user modules

---

## Disclaimer

This repository is tailored for my own setup, so some parts may need adjustment before using it on another machine.
