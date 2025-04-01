#!/bin/bash

# 删除旧的链接
stow -D zsh
stow -D tmux
stow -D clang-format
stow -D powerlevel-10k
stow -D wezterm
stow -D helix
stow -D lazygit
stow -D yazi
stow -D ideavim

if [[ $(hostname) == "MacBookPro" ]]; then
  stow -D yabai
  stow -D skhd
fi

if [[ $(hostname) == "y9000p" ]]; then
  stow -D neofetch-mint
  stow -D polybar
  stow -D conky
  stow -D vscode
fi

if [[ $(hostname) == "MacMini" ]]; then
  stow -D neofetch-mac
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

# 切换到 dotfiles 目录
cd ~/dotfiles

# 使用 stow 链接配置
stow -R zsh
stow -R tmux
stow -R clang-format
stow -R powerlevel-10k
stow -R wezterm
stow -R ideavim
stow -R --target=$HOME/.config/helix helix
stow -R --target=$HOME/.config/lazygit lazygit
stow -R --target=$HOME/.config/yazi yazi

if [[ $(hostname) == "MacBookPro" ]]; then
  stow -R --target=$HOME/.config/yabai yabai
  stow -R --target=$HOME/.config/skhd skhd
  echo "Something of MacBookPro done."
fi

if [[ $(hostname) == "y9000p" ]]; then
  stow -R --target=$HOME/.config/neofetch neofetch-mint
  stow -R --target=$HOME/.config/polybar polybar
  stow -R --target=$HOME/.config/conky conky
  stow -R --target=$HOME/.config/Code/User vscode
  echo "Something of y9000p done."
fi

if [[ $(hostname) == "MacMini" ]]; then
  stow -R --target=$HOME/.config/neofetch neofetch-mac
  echo "Something of MacMini done."
fi

echo "Configurations have been stowed."
