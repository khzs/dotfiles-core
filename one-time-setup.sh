#
echo "entering ${BASH_SOURCE[0]:-${(%):-%N}}"


# bat
mkdir -p ~/.config/bat
ln -s ~/.config/dotfiles-core/bat/config ~/.config/bat/config

# micro
mkdir -p ~/.config/micro
ln -s ~/.config/dotfiles-core/micro/bindings.json ~/.config/micro/bindings.json
ln -s ~/.config/dotfiles-core/micro/settings.json ~/.config/micro/settings.json

# edit
mkdir -p ~/.local/bin
wget -qO- https://github.com/microsoft/edit/releases/download/v1.0.0/edit-1.0.0-x86_64-linux-gnu.xz | unxz > ~/.local/bin/edit
chmod +x ~/.local/bin/edit
