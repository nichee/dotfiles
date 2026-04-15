#!/bin/bash

echo "🚀 Setting up Nicholas's Mac..."

# Install Homebrew if missing
if ! command -v brew &>/dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# CLI tools
echo "Installing CLI tools..."
brew install \
  starship \
  fzf \
  ripgrep \
  fd \
  jq \
  tmux \
  zoxide \
  zsh-autosuggestions \
  zsh-syntax-highlighting \
  gh \
  stow \
  neovim

# fzf keybindings
$(brew --prefix)/opt/fzf/install --key-bindings --completion --no-update-rc

# GUI apps
echo "Installing GUI apps..."
brew install --cask \
  iterm2 \
  rectangle \
  visual-studio-code \
  firefox \
  spotify \
  telegram \
  iina \
  microsoft-outlook \
  toggl-track \
  phraseexpress

# Dotfiles symlinking via stow
echo "Symlinking dotfiles..."
cd "$(dirname "$0")"
stow --target="$HOME" zsh
stow --target="$HOME/.config" starship

# Rectangle config
if [ -f "rectangle/RectangleConfig.json" ]; then
  mkdir -p ~/Library/Application\ Support/Rectangle
  cp rectangle/RectangleConfig.json ~/Library/Application\ Support/Rectangle/RectangleConfig.json
  echo "✅ Rectangle config restored"
fi

# Shell setup
echo "Configuring shell..."
if [ "$SHELL" != "/bin/zsh" ]; then
  chsh -s /bin/zsh
fi

echo "✅ Done! Restart your terminal."
