# Dotfiles

## Overview

- Arch Linux with CachyOS repositories
- Wayland
- niri

## Installation

```bash
./setup.sh
```

## Manual

### Installing CachyOS mirrors

```bash
curl https://mirror.cachyos.org/cachyos-repo.tar.xz -o cachyos-repo.tar.xz
tar xvf cachyos-repo.tar.xz && cd cachyos-repo
sudo ./cachyos-repo.sh
```

It is entirely possible that the pacman version in the script is outdated.
You have to update it if that's the case.

### Install DankShell

[Releases](https://github.com/AvengeMedia/DankMaterialShell/releases)

```bash
systemctl --user enable --now dms
systemctl --user add-wants niri dms
```

#### greetd

Update /etc/greetd/config.toml

```toml
[terminal]
vt = 1

[default_session]
user = "greeter"
command = "/usr/bin/dms-greeter --command niri"
```

Then run:

```bash
dms greeter sync
```

### If using Citrix

```bash
sudo ln -sf /usr/lib64/libunwind.so /usr/lib64/libunwind.so.1
```
