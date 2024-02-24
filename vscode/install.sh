#!/usr/bin/env zsh

set -e
# If uname is not darwin, exit

if [ "$(uname)" != "Darwin" ]; then
  printf "This script is only for macOS\n"
  exit 1
fi

ln -sf "${DOTFILES_LOCATION}/vscode/settings.json" "${HOME}/Library/Application Support/Code/User/settings.json"

CODE_EXTENSIONS=(
donjayamanne.githistory
donjayamanne.python-environment-manager
foxundermoon.shell-format
github.copilot
github.copilot-chat
github.vscode-pull-request-github
golang.go
hashicorp.terraform
kevinrose.vsc-python-indent
ms-azuretools.vscode-azurefunctions
ms-azuretools.vscode-azureresourcegroups
ms-azuretools.vscode-azurestorage
ms-azuretools.vscode-azureterraform
ms-azuretools.vscode-docker
ms-kubernetes-tools.vscode-kubernetes-tools
ms-python.black-formatter
ms-python.debugpy
ms-python.isort
ms-python.pylint
ms-python.python
ms-python.vscode-pylance
ms-vscode-remote.remote-containers
ms-vscode.azure-account
ms-vscode.makefile-tools
qwtel.sqlite-viewer
redhat.vscode-yaml
weaveworks.vscode-gitops-tools
yzhang.markdown-all-in-one
)

printf "\n🚀 Installing the vscode extensions\n"

for ext in "${CODE_EXTENSIONS[@]}"; do printf "installing %s\n" "${ext}" && code --install-extension "${ext}" --force; done