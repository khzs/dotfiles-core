#
echo "entering ${BASH_SOURCE[0]:-${(%):-%N}}"

#
git config --global core.editor "micro"
git config --global pull.rebase true
git config --global push.autoSetupRemote true

# symlink
lndir ~/.config/dotfiles-core/config-overlay ~/.config

#
curl -sS https://starship.rs/install.sh | sh -s -- -b ~/.local/bin -y

#
brew install bat micro yazi
