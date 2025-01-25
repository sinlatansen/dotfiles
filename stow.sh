#!/bin/bash

# 创建必要的配置目录
mkdir -p ~/.config/neofetch
mkdir -p ~/.config/tmux-powerline
mkdir -p ~/.config/helix
mkdir -p ~/.config/lazygit
if [[ $(hostname) == "MacBookPro" ]]; then
	mkdir -p ~/.config/yabai
	mkdir -p ~/.config/skhd
	mkdir -p ~/.config/sketchybar
	echo "Something of MacBookPro done."
fi

if [[ $(hostname) == "jdCloud" ]]; then
	mkdir -p ~/.config/yabai
fi

# 切换到 dotfiles 目录
cd ~/dotfiles

# 使用 stow 链接配置
stow -R zsh
stow -R tmux
stow -R clang-format
stow -R --target=$HOME/.config/neofetch neofetch
stow -R --target=$HOME/.config/tmux-powerline tmux-powerline
stow -R --target=$HOME/.config/helix helix
stow -R --target=$HOME/.config/lazygit lazygit

if [[ $(hostname) == "MacBookPro" ]]; then
	stow -R --target=$HOME/.config/yabai yabai
	stow -R --target=$HOME/.config/skhd skhd
	echo "Something of MacBookPro done."
fi

if [[ $(hostname) == "jdCloud" ]]; then
	stow -R --target=$HOME/.config/yabai yabai
fi


echo "Configurations have been stowed."
