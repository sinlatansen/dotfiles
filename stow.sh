#!/bin/bash

DOTFILES_DIR="$HOME/dotfiles"

bash "$DOTFILES_DIR/scripts/theme.sh"

# 删除旧的链接
stow -D -d "$DOTFILES_DIR" zsh
stow -D -d "$DOTFILES_DIR" tmux
stow -D -d "$DOTFILES_DIR" clang-format
stow -D -d "$DOTFILES_DIR" powerlevel-10k
stow -D -d "$DOTFILES_DIR" wezterm
stow -D -d "$DOTFILES_DIR" helix
stow -D -d "$DOTFILES_DIR" lazygit
stow -D -d "$DOTFILES_DIR" yazi
stow -D -d "$DOTFILES_DIR" ideavim

if [[ $(hostname) == "MacBookPro" ]]; then
  stow -D -d "$DOTFILES_DIR" yabai
  stow -D -d "$DOTFILES_DIR" skhd
fi

if [[ $(hostname) == "y9000p" ]]; then
  stow -D -d "$DOTFILES_DIR" neofetch-mint
  stow -D -d "$DOTFILES_DIR" polybar
  stow -D -d "$DOTFILES_DIR" conky
  stow -D -d "$DOTFILES_DIR" vscode
fi

if [[ $(hostname) == "MacMini" ]]; then
  stow -D -d "$DOTFILES_DIR" neofetch-mac
fi

# 创建必要的配置目录
mkdir -p ~/.config/neofetch
mkdir -p ~/.config/helix
mkdir -p ~/.config/lazygit
mkdir -p ~/.config/yazi
if [[ $(hostname) == "MacBookPro" ]]; then
  mkdir -p ~/.config/yabai
  mkdir -p ~/.config/skhd
  mkdir -p ~/.config/sketchybar
fi
if [[ $(hostname) == "y9000p" ]]; then
  mkdir -p ~/.config/polybar
  mkdir -p ~/.config/conky
fi

# 使用 stow 链接配置
stow -R -d "$DOTFILES_DIR" zsh
stow -R -d "$DOTFILES_DIR" tmux
stow -R -d "$DOTFILES_DIR" clang-format
stow -R -d "$DOTFILES_DIR" powerlevel-10k
stow -R -d "$DOTFILES_DIR" wezterm
stow -R -d "$DOTFILES_DIR" ideavim
stow -R -d "$DOTFILES_DIR" --target="$HOME/.config/helix" helix
stow -R -d "$DOTFILES_DIR" --target="$HOME/.config/lazygit" lazygit
stow -R -d "$DOTFILES_DIR" --target="$HOME/.config/yazi" yazi

if [[ $(hostname) == "MacBookPro" ]]; then
  stow -R -d "$DOTFILES_DIR" --target="$HOME/.config/yabai" yabai
  stow -R -d "$DOTFILES_DIR" --target="$HOME/.config/skhd" skhd
  echo "Something of MacBookPro done."
fi

if [[ $(hostname) == "y9000p" ]]; then
  stow -R -d "$DOTFILES_DIR" --target="$HOME/.config/neofetch" neofetch-mint
  stow -R -d "$DOTFILES_DIR" --target="$HOME/.config/polybar" polybar
  stow -R -d "$DOTFILES_DIR" --target="$HOME/.config/conky" conky
  stow -R -d "$DOTFILES_DIR" --target="$HOME/.config/Code/User" vscode
  echo "Something of y9000p done."
fi

if [[ $(hostname) == "MacMini" ]]; then
  stow -R -d "$DOTFILES_DIR" --target="$HOME/.config/neofetch" neofetch-mac
  echo "Something of MacMini done."
fi

echo "Configurations have been stowed."
