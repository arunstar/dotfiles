# dotfiles

My personal dotfiles for macOS, managed with [GNU Stow](https://www.gnu.org/software/stow/).

Adapted from [omerxx/dotfiles](https://github.com/omerxx/dotfiles).

## What's configured

| Tool | Purpose |
|------|---------|
| [Ghostty](https://ghostty.org/) | Terminal emulator |
| [Neovim](https://neovim.io/) ([LazyVim](https://www.lazyvim.org/)) | Editor |
| [Zellij](https://zellij.dev/) | Terminal multiplexer |
| [AeroSpace](https://nikitabobko.github.io/AeroSpace/guide) | Tiling window manager |
| [Starship](https://starship.rs/) | Shell prompt |
| [SketchyBar](https://felixkratz.github.io/SketchyBar/) | Custom menu bar |
| [Atuin](https://atuin.sh/) | Shell history |

Theme: [Catppuccin](https://catppuccin.com/) (Mocha for most tools).

## Installation

### Prerequisites

[Homebrew](https://brew.sh/) must be installed.

### Setup

```bash
git clone https://github.com/arunstar/dotfiles ~/dotfiles
cd ~/dotfiles
./setup.sh
```

The setup script installs all tools via Homebrew and symlinks the configs into `~/.config/` using Stow.

### Manual shell setup

After running `setup.sh`, append the following to your `~/.zshrc` to enable the prompt and CLI integrations:

```bash
eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(zoxide init zsh)"
eval "$(atuin init zsh)"
eval "$(direnv hook zsh)"
eval "$(mise activate zsh)"

alias l="eza -l --icons --git -a"
alias lt="eza --tree --level=2 --long --icons --git"
alias cat=bat
```

## Structure

```
~/dotfiles
├── aerospace/       # Window manager
├── atuin/           # Shell history
├── ghostty/         # Terminal
├── nvim/            # Editor (LazyVim)
├── sketchybar/      # Menu bar
├── starship/        # Prompt
└── zellij/          # Multiplexer
```

Each subdirectory mirrors the layout under `~/.config/`. Stow creates symlinks to map them in place.

## Notes

- **AeroSpace** requires accessibility permissions on first launch.
- **SketchyBar** depends on AeroSpace running for workspace indicators. Start with `brew services start sketchybar`.
- **Neovim**: LazyVim bootstraps itself on first launch — just open `nvim` and let it install plugins.
