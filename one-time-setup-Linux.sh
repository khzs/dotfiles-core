#
echo "entering ${BASH_SOURCE[0]:-${(%):-%N}}"

#
sudo apt install -y bat micro l3afpad petname zsh zsh-autosuggestions \
  xutils-dev
# xutils-dev    : for lndir
sudo snap install yazi --classic

#
chsh -s $(which zsh)
cp ~/.config/dotfiles-core/copy/.zshrc ~/

#
sed -i '/#umask 022/a\\necho "entering $(realpath "${BASH_SOURCE[0]}")"' ~/.profile
sed -i '/# for examples/a\\necho "entering $(realpath "${BASH_SOURCE[0]}")"' ~/.bashrc
echo "\nsource ~/.config/dotfiles-core/.linuxbashrc" >> ~/.bashrc

#
source ~/.config/dotfiles-core/one-time-setup.sh
