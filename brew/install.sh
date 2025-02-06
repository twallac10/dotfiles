set -e

# If brew is not installed and the arch is not arm64, install brew
if ! command -v brew &> /dev/null; then
  printf "\n🚀 Installing the brew package manager\n"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# If brew is installed, install the packages from packages.txt

if command -v brew &> /dev/null; then
  printf "\n🚀 Installing the brew packages\n"
  brew bundle --file=$DOTFILES_LOCATION/brew/Brewfile
  
  if command -v jamf &> /dev/null; then
    printf "\n🚀 Installing the brew packages for Jamf\n"
    brew bundle --file=$DOTFILES_LOCATION/brew/Brewfile-personal
  fi
fi