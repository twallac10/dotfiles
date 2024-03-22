set -e

###
# Installation of packages, configurations, and dotfiles.
###
DOTFILES_LOCATION=$(pwd)
export DOTFILES_LOCATION;

echo "DOTFILES_LOCATION: ${DOTFILES_LOCATION}"
echo "Starting installation..."

###
# Install dependencies
###
if [ "$(uname)" = "Darwin" ]; then
    echo "Installing dependencies for macOS"
    ./bin/dotfiles install brew
    ./bin/dotfiles install omz
    ./bin/dotfiles install zsh
fi

echo "Installing dependencies for Linux"

./bin/dotfiles install starship
#./bin/dotfiles install brew
./bin/dotfiles install vscode
./bin/dotfiles install git