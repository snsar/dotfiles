# ✨ Dotfiles for Linux Mint

![Linux Mint](https://img.shields.io/badge/Linux_Mint-87CF3E?style=for-the-badge&logo=linux-mint&logoColor=white)
![i3wm](https://img.shields.io/badge/i3wm-2D2D2D?style=for-the-badge&logo=i3&logoColor=white)
![Neovim](https://img.shields.io/badge/NeoVim-57A143?style=for-the-badge&logo=neovim&logoColor=white)
![Tmux](https://img.shields.io/badge/tmux-1BB91F?style=for-the-badge&logo=tmux&logoColor=white)
![Rofi](https://img.shields.io/badge/rofi-5294E2?style=for-the-badge&logoColor=white)

A modern, elegant configuration for Linux Mint with i3wm, NeoVim, Tmux, and more. These dotfiles are designed to create a productive and visually appealing development environment.

## 📋 Table of Contents

- [Overview](#-overview)
- [Components](#-components)
- [Installation](#-installation)
- [Configuration](#-configuration)
  - [Tmux](#tmux)
  - [i3wm](#i3wm)
  - [NeoVim](#neovim)
  - [Rofi](#rofi)
  - [Picom](#picom)
- [Screenshots](#-screenshots)
- [License](#-license)

## 🚀 Overview

This repository contains my personal dotfiles for Linux Mint, focusing on a minimal yet powerful setup using i3 window manager. The configuration is designed to be both functional and aesthetically pleasing, with a focus on keyboard-driven workflow.

## 🧩 Components

- **Window Manager**: i3wm for tiling window management
- **Terminal Multiplexer**: Tmux for terminal session management
- **Editor**: NeoVim with NvChad for code editing
- **Application Launcher**: Rofi with custom Nord theme
- **Compositor**: Picom for window effects and transparency
- **Terminal**: Wezterm with custom configuration

## 📥 Installation

Clone this repository to your home directory:

```bash
git clone https://github.com/yourusername/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

Use GNU Stow to create symlinks (install if needed):

```bash
sudo apt install stow
stow tmux     # For tmux configuration
stow i3       # For i3wm configuration
stow nvim     # For neovim configuration
stow rofi     # For rofi configuration
stow picom    # For picom configuration
stow wezterm  # For wezterm configuration
```

## ⚙️ Configuration

### Tmux

Tmux is configured with a modern, user-friendly setup that includes:

- `C-a` prefix (instead of default `C-b`)
- Mouse support for scrolling and pane selection
- Custom status bar with system information
- Easy window and pane management

#### Tmux Key Bindings

| Key Binding | Function |
|-------------|----------|
| `C-a` | Prefix key (replaces C-b) |
| `C-a c` | Create new window |
| `C-a ,` | Rename window |
| `C-a 0-9` | Switch to window by number |
| `C-a n` | Switch to next window |
| `C-a p` | Switch to previous window |
| `C-a v` | Split pane vertically |
| `C-a s` | Split pane horizontally |
| `Alt+Arrow` | Navigate between panes |
| `C-a z` | Toggle pane zoom |
| `C-a d` | Detach from session |
| `C-a r` | Reload configuration |
| `C-a I` | Install plugins |

#### Useful Tmux Commands

```bash
# Create new session
tmux new-session -s [session_name]

# Attach to existing session
tmux attach-session -t [session_name]

# List running sessions
tmux ls

# Create new window (from within tmux)
C-a c

# Create new vertical pane
C-a v

# Create new horizontal pane
C-a s
```

#### Auto-start Tmux (Optional)

Add to your `~/.bashrc` or `~/.zshrc`:

```bash
# Auto-start Tmux
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi
```

#### Tmuxinator for Advanced Session Management

```bash
sudo apt install ruby-full
sudo gem install tmuxinator
```

Create a sample configuration:

```bash
mkdir -p ~/.config/tmuxinator
tmuxinator new project
```

Example tmuxinator configuration:

```yaml
name: project
root: ~/projects/your-project

windows:
  - editor:
      layout: main-vertical
      panes:
        - vim
        - git status
  - server: npm start
  - logs: tail -f logs/development.log
```

Start a project with:

```bash
tmuxinator start project
```

### i3wm

The i3 window manager is configured for efficient keyboard-driven workflow with custom keybindings and integration with other tools like Rofi and Picom.

### NeoVim

NeoVim is configured using NvChad for a modern IDE-like experience with:
- Syntax highlighting and LSP support
- File explorer and fuzzy finding
- Custom keybindings and themes
- Code formatting and linting

### Rofi

Rofi is configured with a custom Nord theme for application launching, window switching, and more.

### Picom

Picom compositor provides:
- Window transparency effects
- Smooth transitions
- Drop shadows
- Blur effects for terminal windows

## 📸 Screenshots

*Coming soon*

## 📄 License

This project is licensed under the Unlicense - see the [LICENSE](LICENSE) file for details. Feel free to use, modify, and distribute as you wish.
