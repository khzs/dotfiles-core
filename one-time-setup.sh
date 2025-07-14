#
echo "entering ${BASH_SOURCE[0]:-${(%):-%N}}"

#
git config --global core.editor "micro"

# symlink
lndir ~/.config/dotfiles-core/config-overlay ~/.config

#
curl -sS https://starship.rs/install.sh | sh -s -- -b ~/.local/bin -y
