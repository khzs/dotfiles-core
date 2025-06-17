#
echo "entering ${BASH_SOURCE[0]:-${(%):-%N}}"

#
sudo apt install -y bat micro l3afpad \
  xutils-dev
# xutils-dev    : for lndir

sudo snap install yazi --classic

#
sed -i '/#umask 022/a\\necho "entering $(realpath "${BASH_SOURCE[0]}")"' ~/.profile
sed -i '/# for examples/a\\necho "entering $(realpath "${BASH_SOURCE[0]}")"' ~/.bashrc
echo "source ~/.config/dotfiles-core/.linuxbashrc" >> ~/.bashrc

#
source ~/.config/dotfiles-core/one-time-setup.sh
