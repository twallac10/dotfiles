set -e

# If brew is not installed and the arch is not arm64, install brew
if ! command -v brew &> /dev/null && [ "$(uname -m)" != "arm64" ]; then
  printf "\n🚀 Installing the brew package manager\n"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi