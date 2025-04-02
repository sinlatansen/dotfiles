#!/bin/bash

# 预定义主题列表
themes=("nord" "dracula" "gruvbox")

# 主题映射
declare -A vscode_themes=(
    ["nord"]="Catppuccin Macchiato"
    ["dracula"]="Dracula Theme Soft"
    ["gruvbox"]="Gruvbox Dark Soft"
)

declare -A helix_themes=(
    ["nord"]="my-theme"
    ["dracula"]="dracula"
    ["gruvbox"]="gruvbox_dark_soft"
)

declare -A wezterm_themes=(
    ["nord"]="nord"
    ["dracula"]="Dracula (Official)"
    ["gruvbox"]="Gruvbox dark, soft (base16)"
)

declare -A app_themes=(
    ["nord"]="Colloid-Dark-Nord"
    ["dracula"]="Colloid-Dark-Dracula"
    ["gruvbox"]="Colloid-Dark-Gruvbox"
)

declare -A icon_themes=(
    ["nord"]="Colloid-Nord-Dark"
    ["dracula"]="Colloid-Dracula-Dark"
    ["gruvbox"]="Colloid-Gruvbox-Dark"
)

# 选择主题
echo "请选择一个主题："
select THEME in "${themes[@]}"; do
    if [[ -n "$THEME" ]]; then
        echo "切换到主题: $THEME"
        break
    else
        echo "无效选择，请重新选择。"
    fi
done

# 配置文件路径
VSCODE_CONFIG="$HOME/dotfiles/vscode/settings.json"
HELIX_CONFIG="$HOME/dotfiles/helix/config.toml"
WEZTERM_CONFIG="$HOME/dotfiles/wezterm/.wezterm.lua"
WALLPAPER_DIR="$HOME/Pictures/themes"

# 修改 VSCode 主题
if [[ -f "$VSCODE_CONFIG" ]]; then
    echo "修改vscode主题"
    sed -i "s/\"workbench.colorTheme\": \".*\"/\"workbench.colorTheme\": \"${vscode_themes[$THEME]}\"/" "$VSCODE_CONFIG"
fi

# 修改 Helix 主题
if [[ -f "$HELIX_CONFIG" ]]; then
    echo "修改helix主题"
    sed -i "s/theme = \".*\"/theme = \"${helix_themes[$THEME]}\"/" "$HELIX_CONFIG"
fi

# 修改 WezTerm 主题
if [[ -f "$WEZTERM_CONFIG" ]]; then
    echo "修改wezterm主题"
    sed -i "s|^\(config.color_scheme = \)\"[^\"]*\"|\1\"${wezterm_themes[$THEME]}\"|" "$WEZTERM_CONFIG"
fi

# 修改 Cinnamon 主题
echo "修改Cinnamon主题"
gsettings set org.cinnamon.desktop.interface gtk-theme ${app_themes[$THEME]}
gsettings set org.cinnamon.desktop.interface icon-theme ${icon_themes[$THEME]}
gsettings set org.cinnamon.theme name ${app_themes[$THEME]}

# 更换壁纸
WALLPAPER="$WALLPAPER_DIR/$THEME.png"
if [[ -f "$WALLPAPER" ]]; then
    echo "更换壁纸"
    gsettings set org.cinnamon.desktop.background picture-uri "file://$WALLPAPER"
fi

echo "主题已切换为: $THEME"
