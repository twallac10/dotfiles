set -e
# If uname is not darwin, exit

if [ "$(uname)" != "Darwin" ]; then
  printf "This script is only for macOS\n"
  exit 0
fi

ln -sf "${DOTFILES_LOCATION}/vscode/settings.json" "${HOME}/Library/Application Support/Code/User/settings.json"

