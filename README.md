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

### If using Citrix

```bash
sudo ln -sf /usr/lib64/libunwind.so /usr/lib64/libunwind.so.1
```
