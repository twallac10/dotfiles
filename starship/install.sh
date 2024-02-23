set -e

if test ! $(which starship); then
  printf "\n🚀 Installing the starship prompt\n"
  sh -c "$(curl -fsSL https://starship.rs/install.sh)"
fi