#
echo "entering ${BASH_SOURCE[0]:-${(%):-%N}}"

#
sudo apt install -y bat micro l3afpad petname zsh zsh-autosuggestions \
  xutils-dev
# xutils-dev    : for lndir

sudo snap install yazi --classic

chsh -s $(which zsh)

#
sed -i '/#umask 022/a\\necho "entering $(realpath "${BASH_SOURCE[0]}")"' ~/.profile
sed -i '/# for examples/a\\necho "entering $(realpath "${BASH_SOURCE[0]}")"' ~/.bashrc
echo "\nsource ~/.config/dotfiles-core/.linuxbashrc" >> ~/.bashrc

# eloszor fel kell loni az ujonnan installalt zsh-t, hogy populalja default configgal, es csak utana beleverni
# echo "entering ${BASH_SOURCE[0]:-${(%):-%N}}" -> .zshrc eleje
# echo "\nsource ~/.config/dotfiles-core/.linuxzshrc" >> ~/.zshrc

#
source ~/.config/dotfiles-core/one-time-setup.sh
