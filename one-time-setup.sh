#
echo "entering ${BASH_SOURCE[0]:-${(%):-%N}}"

#
git config --global core.editor "micro"
git config --global pull.rebase true
git config --global push.autoSetupRemote true

# symlink
lndir ~/.config/dotfiles-core/config-overlay ~/.config

#
brew install --cask font-fira-code-nerd-font       # yazihoz es starshiphez biztosan kell, asszem kittyhez is
brew install bat micro yazi starship
