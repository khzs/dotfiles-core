#
echo "entering ${BASH_SOURCE[0]:-${(%):-%N}}"

#
git config --global core.editor "micro"
git config --global pull.rebase true
git config --global push.autoSetupRemote true
git config --global core.excludesFile ~/.gitignore_global

# symlink
lndir ~/.config/dotfiles-core/config-overlay ~/.config
mkdir -p ~/.config/fresh && touch ~/.config/fresh/config.json
mkdir -p ~/.config/ghostty && touch ~/.config/ghostty/config.ghostty
touch ~/.gitignore_global

#
brew install --cask font-adwaita-mono-nerd-font      # Mono = basic; Mono ... Mono = smaller icons in yazi
brew install bat micro yazi starship midnight-commander lazygit fresh-editor
