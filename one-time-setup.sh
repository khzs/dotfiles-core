

sudoer()
{
  sudo apt install hstr bat micro l3afpad -y
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


mkdir -p ~/.config/micro && echo '{"tabsize": 2, "tabstospaces": true}' > ~/.config/micro/settings.json

# edit
mkdir -p ~/.local/bin
wget -qO- https://github.com/microsoft/edit/releases/download/v1.0.0/edit-1.0.0-x86_64-linux-gnu.xz | unxz > ~/.local/bin/edit
chmod +x ~/.local/bin/edit

# aliases
echo "source ~/.config/dotfiles-core/.aliases" >> ~/.bashrc
