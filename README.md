# Dotfiles

Welcome to my dotfiles repository! This repository contains my personal configuration files for various applications and tools. Feel free to explore, use, and adapt them to your own setup.

## Table of Contents

- [Introduction](#introduction)
- [Installation](#installation)
- [Usage](#usage)
- [Included Configurations](#included-configurations)
- [Guide](#guide)

## Introduction

Dotfiles are configuration files for various applications and tools that customize your development environment. By version-controlling these files, you can easily set up your environment on new machines and share your configuration with others.

## Installation

### Prerequisites

Before you begin, ensure you have the following tools installed:

- Git
- [GNU Stow](https://www.gnu.org/software/stow/) (recommended for managing symlinks)

### Clone the Repository

Clone this repository to your home directory or any other directory you prefer:

```bash
git clone https://github.com/yourusername/dotfiles.git ~/dotfiles
```

### Symlink the Dotfiles

To create symlinks for the dotfiles in your home directory, use GNU Stow or your preferred method:

```bash
cd ~/dotfiles
stow -v -t ~ *
```

## Usage

After creating the symlinks, the configuration files will be in place and the corresponding applications will use them automatically. You can then start or restart the applications to apply the new configurations.

## Included Configurations

This repository includes configuration files for the following tools and applications:

- **Alacritty**: `.config/alacritty/alacritty.toml`
- **Neovim**: `.config/nvim`
  - `init.lua`
  - `lazy-lock.json`
  - `lazyvim.json`
  - `.luarc.json`
  - `.neoconf.json`
  - `stylua.toml`
  - `lua/config`
    - `autocmds.lua`
    - `keymaps.lua`
    - `lazy.lua`
    - `options.lua`
  - `lua/plugins`
    - `alpha-nvim.lua`
    - `bufferline.lua`
    - `elixir-tools.lua`
    - `example.lua`
    - `flash.lua`
    - `indent-blankline.lua`
    - `lsp-config.lua`
    - `lualine.lua`
    - `neotest-elixir.lua`
    - `neo-tree.lua`
    - `nvim-cmp.lua`
    - `project-nvim.lua`
    - `tailwind-sorter.lua`
    - `telescope.lua`
    - `themes.lua`
    - `transparent.lua`
    - `trouble.lua`
    - `which-key.lua`
- **Tmux**: `.tmux.conf`
- **Zsh**: `.zshrc`

Feel free to explore the repository to see all included configurations.

## Guide

You can find a detailed guide on how to set up and use Stow in this video [here](https://www.youtube.com/watch?v=y6XCebnB9gs).
