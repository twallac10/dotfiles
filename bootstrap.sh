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
./bin/dotfiles install omz
./bin/dotfiles install starship
./bin/dotfiles install zsh
#./bin/dotfiles install brew
./bin/dotfiles install vscode
./bin/dotfiles install git