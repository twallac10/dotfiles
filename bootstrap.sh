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
    ${DOTFILES_LOCATION}/bin/dotfiles install brew
    ${DOTFILES_LOCATION}/bin/dotfiles install omz
    ${DOTFILES_LOCATION}/bin/dotfiles install zsh
fi

echo "Installing dependencies for Linux"

${DOTFILES_LOCATION}/bin/dotfiles install starship
echo "Installing vscode extensions"
#./bin/dotfiles install brew
${DOTFILES_LOCATION}/bin/dotfiles install vscode
${DOTFILES_LOCATION}/bin/dotfiles install git
