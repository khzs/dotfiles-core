#
echo "entering ${BASH_SOURCE[0]:-${(%):-%N}}"

#
git config --global core.editor "micro"
git config --global pull.rebase true
git config --global push.autoSetupRemote true

# symlink
lndir ~/.config/dotfiles-core/config-overlay ~/.config
mkdir -p ~/.config/fresh && touch ~/.config/fresh/config.json

#
uname -r | grep WSL   || brew install --cask font-adwaita-mono-nerd-font      # Mono = basic; Mono ... Mono = smaller icons in yazi
brew install bat micro yazi starship midnight-commander lazygit fresh-editor
