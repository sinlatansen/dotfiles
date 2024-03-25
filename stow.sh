#!/bin/bash

# 创建必要的配置目录
mkdir -p ~/.config/nvim
mkdir -p ~/.config/neofetch
mkdir -p ~/.config/tmux-powerline
mkdir -p ~/.config/yabai
mkdir -p ~/.config/skhd
mkdir -p ~/.config/sketchybar

# 切换到 dotfiles 目录
cd ~/dotfiles

# 使用 stow 链接配置
stow -R zsh
stow -R tmux
stow -R --target=$HOME/.config/nvim nvim
stow -R --target=$HOME/.config/neofetch neofetch
stow -R --target=$HOME/.config/tmux-powerline tmux-powerline

if [[ $(hostname) ==  "MacBookPro" ]]; then
    stow -R --target=$HOME/.config/yabai yabai
    stow -R --target=$HOME/.config/skhd skhd
    stow -R --target=$HOME/.config/sketchybar sketchybar

echo "Configurations have been stowed."
