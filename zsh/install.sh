set -e

if [ -n "$ZSH_VERSION" ]; then
    printf "Shell is zsh"
    ln -sf "${DOTFILES_LOCATION}/zsh/.zshrc" "${HOME}/.zshrc"
    ln -sf "${DOTFILES_LOCATION}/zsh/benmatselby.zsh-theme" "${HOME}/.oh-my-zsh/custom/themes/"
else
    printf "Shell is not zsh"
fi
