# Dotfiles

**my opinionated dotfiles**

![preview](screenshots/preview.png)

## Overview

-   Arch Linux
-   X11
-   i3 with no compositor
-   Development with [toolbox](https://containertoolbx.org/) containers.

## Requirements

- A sudo, non-root user (for now)
- ansible

## Get started

### Cloning

```sh
$ git clone -b master https://github.com/mstcl/dotfiles
$ cd dotfiles
$ git checkout prod
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

#### zsh

zsh installation is found on another separate repo:

```sh
$ git clone https://github.com/mstcl/zsh
$ cd zsh
```

[https://github.com/mstcl/zsh](https://github.com/mstcl/zsh)

Read the `README.md` and proceed from there.

#### neovim

neovim installation is found on another separate repo:

```sh
$ git clone https://github.com/mstcl/nvim
$ cd nvim
```

[https://github.com/mstcl/nvim](https://github.com/mstcl/nvim)

Read the `README.md` and proceed from there.
