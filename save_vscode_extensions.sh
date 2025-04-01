#!/bin/bash

echo "Deleting $HOME/dotfiles/vscode/extensions.txt"
rm "$HOME/dotfiles/vscode/extensions.txt"
echo "Saving vscode extensions to $HOME/dotfiles/vscode/extensions.txt"
code --list-extensions > "$HOME/dotfiles/vscode/extensions.txt"
echo "Done"