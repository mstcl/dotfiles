# Dotfiles

**lckdscl's opinionated dotfiles**

![preview](screenshots/preview.png)

## Overview

-   Arch Linux
-   X11
-   i3 with no compositor
-   Development with [toolbox](https://containertoolbx.org/) containers.

## Prerequisite

- A sudo, non-root user (for now)

## Get started

### Cloning

```sh
$ git clone -b master https://github.com/mstcl/dotfiles
$ cd dotfiles
$ git checkout prod
```

### Installing Ansible

Use [uv](https://astral.sh/blog/uv) as a pip wrapper:

```sh
$ sudo pacman -S --needed --noconfirm uv
$ uv venv .venv && source .venv/bin/activate && uv pip install -r requirements.txt
```

### Configuration

Read through what's available to configure in `host_vars/localhost.yml` and
edit it.

### Installation

```sh
$ ansible-playbook main.yml --diff --ask-become-pass
```

### External modules

There are a few external Ansible modules to complete the installation.

#### Toolbox setup

While we installed the toolbox containers, there is nothing on them. We can
install declared packages using trizen, which is tiny enough to run on these
containers.

We declare the packages for each toolbox as files in `toolbox/packages_<toolbox_name>.txt`.
Then, to install them:

```sh
$ cd toolbox
$ toolbox enter <toolbox_name>
$ LC_ALL="C.UTF-8" ansible-playbook main.yml -e toolbox="<toolbox_name>"
```

#### zsh

zsh installation is found on another separate repo:

```sh
$ git clone https://github.com/mstcl/zsh
$ cd zsh
```

Read the `README.md` and proceed from there.

#### neovim

neovim installation is found on another separate repo:

```sh
$ git clone https://github.com/mstcl/nvim
$ cd nvim
```

Read the `README.md` and proceed from there.
