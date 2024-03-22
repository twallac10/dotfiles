set -e

install_script_url="https://starship.rs/install.sh"

if ! command -v starship >/dev/null 2>&1; then
  printf "\n🚀 Installing the starship prompt\n"
  curl -sS "$install_script_url" | sh -s -- -y

  if [ "$(uname)" = "Darwin" ]; then
    printf "Configuring zshrc for starship"
    echo 'eval "$(starship init zsh)"' >> ~/.zshrc
  else
    printf "Configuring bashrc for starship"
    echo 'eval "$(starship init bash)"' >> ~/.bashrc
  fi

  printf "Copying starship.toml to .config directory"
  mkdir -p ~/.config
  cp -r "$DOTFILES_LOCATION/starship/config" ~/.config/starship
else
  printf "\n🚀 Starship is already installed\n"
fi



