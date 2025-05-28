#

sudoer()
{
  sudo apt install bat micro l3afpad libicu-dev -y
  # hstr
  # sudo snap install yazi --classic
}


hostile()
{
  # hstr
  echo "https://github.com/dvorka/hstr/releases"

  # bat

  # micro
  mkdir -p ~/.local/bin
  cd ~/.local/bin
  curl https://getmic.ro | bash
  cd -
}


if sudo -l &>/dev/null; then
  sudoer
else
  hostile
fi


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

# sourcing
sed -i '/#umask 022/a\\necho "entering $(realpath "${BASH_SOURCE[0]}")"' ~/.profile
sed -i '/# for examples/a\\necho "entering $(realpath "${BASH_SOURCE[0]}")"' ~/.bashrc
echo "source ~/.config/dotfiles-core/.rc" >> ~/.bashrc
