#
echo "entering ${BASH_SOURCE[0]:-${(%):-%N}}"

#
sudoer()
{
  # xutils-dev    : for lndir
  sudo apt install -y bat micro l3afpad \
    xutils-dev

  sudo snap install yazi --classic
}


hostile()
{
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



# sourcing
sed -i '/#umask 022/a\\necho "entering $(realpath "${BASH_SOURCE[0]}")"' ~/.profile
sed -i '/# for examples/a\\necho "entering $(realpath "${BASH_SOURCE[0]}")"' ~/.bashrc
echo "source ~/.config/dotfiles-core/.linuxbashrc" >> ~/.bashrc

#
source ~/.config/dotfiles-core/one-time-setup.sh
