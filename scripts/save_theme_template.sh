#!/bin/bash

echo "Copying template files..."

declare -A template_map=(
  ["vscode/settings.json"]="vscode/settings.json.template"
  ["helix/config.toml"]="helix/config.toml.template"
  ["wezterm/.wezterm.lua"]="wezterm/.wezterm.lua.template"
)

for file in "${!template_map[@]}"; do
  src="$file"
  dst="${template_map[$file]}"

  if [[ -f "$src" ]]; then
    echo "📄 copy $src -> $dst"
    cp "$src" "$dst"
    git add "$dst"
  fi
done

echo "Copy template files done"
