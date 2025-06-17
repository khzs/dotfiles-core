#
echo "entering ${BASH_SOURCE[0]:-${(%):-%N}}"


# symlink
lndir ~/.config/dotfiles-core/config-overlay ~/.config

#
curl -sS https://starship.rs/install.sh | sh
