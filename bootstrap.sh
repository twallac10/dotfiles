set -e

###
# Installation of packages, configurations, and dotfiles.
###

DOTFILES_LOCATION=$(pwd)
export DOTFILES_LOCATION;

echo "DOTFILES_LOCATION: ${DOTFILES_LOCATION}"

printf "\n🚀 Creating symlinks to dotfiles\n"

# Create symlinks for dotfiles only in the base dir using a loop 
for file in $(find . -maxdepth 1 -name ".*"); do
	if [ -f "$file" ]; then
		ln -sfv ${DOTFILES_LOCATION}/${file} ~
	fi
done

echo "Starting installation..."

###
# Install dependencies
###
if [ "$(uname -o)" = "Darwin" ]; then
    echo "Installing dependencies for macOS"
    ${DOTFILES_LOCATION}/bin/dotfiles install brew
    ${DOTFILES_LOCATION}/bin/dotfiles install omz
    ${DOTFILES_LOCATION}/bin/dotfiles install zsh
fi

echo "Installing dependencies for Linux"

${DOTFILES_LOCATION}/bin/dotfiles install starship
${DOTFILES_LOCATION}/bin/dotfiles install vscode
${DOTFILES_LOCATION}/bin/dotfiles install git

printf "\n🚀 Syncing configuration files\n"



if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;