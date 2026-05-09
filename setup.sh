#!/usr/bin/env bash
set -e

echo "Installing tools via Homebrew..."

# CLI tools
brew install neovim starship zoxide atuin fzf fd bat eza stow

# Cask apps (GUI)
brew install --cask ghostty nikitabobko/tap/aerospace

# SketchyBar
brew tap FelixKratz/formulae
brew install sketchybar

# Fonts (needed for sketchybar icons and starship)
brew install --cask font-hack-nerd-font font-sf-pro

# Zellij
brew install zellij

echo ""
echo "Symlinking configs with stow..."
cd ~/dotfiles && stow .

echo ""
echo "Done! Next steps:"
echo "  1. Open Ghostty"
echo "  2. Run 'nvim' to let LazyVim bootstrap plugins"
echo "  3. Start AeroSpace from Applications"
echo "  4. Start SketchyBar: brew services start sketchybar"
echo "  5. Add to your .zshrc:"
echo '     eval "$(starship init zsh)"'
echo '     export STARSHIP_CONFIG=~/.config/starship/starship.toml'
echo '     eval "$(zoxide init zsh)"'
echo '     eval "$(atuin init zsh)"'
echo '     alias l="eza -l --icons --git -a"'
echo '     alias lt="eza --tree --level=2 --long --icons --git"'
echo '     alias cat=bat'
