# Dotfiles

Welcome to my dotfiles repository! This repository contains my personal configuration files for various applications and tools. Feel free to explore, use, and adapt them to your own setup.

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [Included Configurations](#included-configurations)
- [Customization](#customization)
- [Contributing](#contributing)
- [License](#license)

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

Next you can use GNU Stow to symlink the configuration files to your home directory:

```bash
sudo apt-get install stow

```

### Symlink Configurations

```bash

cd ~/dotfiles && stow -v -t ~ *

```

### Install oh-my-zsh

```bash

sudo apt-get install zsh

```

```

```
