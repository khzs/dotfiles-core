#
echo "entering ${BASH_SOURCE[0]:-${(%):-%N}}"

#
sudo apt install -y bat micro l3afpad petname zsh zsh-autosuggestions xutils-dev build-essential
# xutils-dev        : for lndir
# build-essential   : for brew
sudo snap install yazi --classic

#
cp ~/.config/dotfiles-core/copy/.zshrc ~/
chsh -s $(which zsh)

#
sed -i '/#umask 022/a\\necho "entering $(realpath "${BASH_SOURCE[0]}")"' ~/.profile
sed -i '/# for examples/a\\necho "entering $(realpath "${BASH_SOURCE[0]}")"' ~/.bashrc
echo "\nsource ~/.config/dotfiles-core/.linuxbashrc" >> ~/.bashrc

#
source ~/.config/dotfiles-core/one-time-setup.sh
