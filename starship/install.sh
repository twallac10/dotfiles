set -e

if test ! $(which starship); then
  printf "\n🚀 Installing the starship prompt\n"
  curl -sS https://starship.rs/install.sh | sh -s -- -y
fi

if [ "$(uname)" = "Darwin" ]; then
  echo "Configuring zshrc for starship"
  echo 'eval "$(starship init zsh)"' >> ~/.zshrc
else
  echo "Configuring bashrc for starship"
  echo 'eval "$(starship init bash)"' >> ~/.bashrc
fi