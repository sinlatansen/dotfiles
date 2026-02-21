#!/bin/bash

DOTFILES_DIR="$HOME/dotfiles"

# 删除旧的链接
stow -D -d "$DOTFILES_DIR" zsh
stow -D -d "$DOTFILES_DIR" tmux
stow -D -d "$DOTFILES_DIR" clang-format
stow -D -d "$DOTFILES_DIR" powerlevel-10k
stow -D -d "$DOTFILES_DIR" helix
stow -D -d "$DOTFILES_DIR" lazygit
stow -D -d "$DOTFILES_DIR" yazi
stow -D -d "$DOTFILES_DIR" ideavim

if [[ $(hostname) == "MacBookPro" ]]; then
fi

if [[ $(hostname) == "y9000p" ]]; then
fi

if [[ $(hostname) == "MacMini" ]]; then
  stow -D -d "$DOTFILES_DIR" neofetch-mac
fi

# 创建必要的配置目录
mkdir -p ~/.config/neofetch
mkdir -p ~/.config/helix
mkdir -p ~/.config/lazygit
mkdir -p ~/.config/yazi

# 使用 stow 链接配置
stow -R -d "$DOTFILES_DIR" zsh
stow -R -d "$DOTFILES_DIR" tmux
stow -R -d "$DOTFILES_DIR" clang-format
stow -R -d "$DOTFILES_DIR" powerlevel-10k
stow -R -d "$DOTFILES_DIR" ideavim
stow -R -d "$DOTFILES_DIR" --target="$HOME/.config/helix" helix
stow -R -d "$DOTFILES_DIR" --target="$HOME/.config/lazygit" lazygit
stow -R -d "$DOTFILES_DIR" --target="$HOME/.config/yazi" yazi

if [[ $(hostname) == "MacMini" ]]; then
  stow -R -d "$DOTFILES_DIR" --target="$HOME/.config/neofetch" neofetch-mac
  echo "Something of MacMini done."
fi

echo "Configurations have been stowed."
