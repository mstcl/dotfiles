# Dotfiles

**my opinionated dotfiles**

## Overview

- Arch Linux
- X11
- i3 with no compositor
- Additional packages in [toolbox](https://containertoolbx.org/) containers.

## Requirements

- ansible

## Get started

### Cloning

```sh
$ git clone https://github.com/mstcl/dotfiles
$ cd dotfiles
```

### Configuration

Read through what's available to configure in `host_vars/localhost.yml` and edit
it.

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

## Manual

```bash
sudo ln -sf /usr/lib64/libunwind.so /usr/lib64/libunwind.so.1
```
