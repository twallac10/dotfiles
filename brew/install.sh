set -e

# If brew is not installed and the arch is not arm64, install brew
if ! command -v brew &> /dev/null && [ "$(uname -m)" != "arm64" ]; then
  printf "\n🚀 Installing the brew package manager\n"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# If brew is installed, install the packages from packages.txt

if command -v brew &> /dev/null; then
  printf "\n🚀 Installing the brew packages\n"
  BREW_PACKAGES=($(cat "${DOTFILES_LOCATION}/brew/packages.txt"))
  for pkg in "${BREW_PACKAGES[@]}"; do
    printf "installing %s\n" "${pkg}" && brew install "${pkg}"
  done
fi