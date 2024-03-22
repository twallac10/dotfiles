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

printf "\n🚀 Syncing configuration files\n"
function doIt() {
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude ".osx" \
		--exclude "bootstrap.sh" \
		--exclude "README.md" \
		--exclude "LICENSE-MIT.txt" \
		-avh --no-perms . ~;
	source ~/.bash_profile;
}

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