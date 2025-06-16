#
echo "entering ${BASH_SOURCE[0]:-${(%):-%N}}"


# symlink
lndir ~/.config/dotfiles-core ~/.config

# edit
mkdir -p ~/.local/bin
wget -qO- https://github.com/microsoft/edit/releases/download/v1.0.0/edit-1.0.0-x86_64-linux-gnu.xz | unxz > ~/.local/bin/edit
chmod +x ~/.local/bin/edit
