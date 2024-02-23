set -e

if test ! $(which starship); then
  printf "\n🚀 Installing the starship prompt\n"
  curl -sS https://starship.rs/install.sh | sh -s -- -y

fi