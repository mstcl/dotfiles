# Dotfiles

**lckdscl's opinionated dotfiles**

![preview](screenshots/preview.png)

## Overview

-   Arch Linux
-   X11
-   i3 with no compositor

## Get started

### Prerequisite

- A sudo, non-root user (for now)

### Getting ansible installed

Use uv as a pip wrapper

```sh
$ sudo pacman -S --needed --noconfirm uv
$ uv venv .venv && source .venv/bin/activate && uv pip install -r requirements.txt
```

### Core

```sh
$ ansible-playbook main.yml --diff --ask-become-pass
```

### Toolbox

```sh
$ cd toolbox
$ toolbox enter
$ LC_ALL="C.UTF-8" ansible-playbook main.yml
```
