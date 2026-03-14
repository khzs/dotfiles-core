#
echo "entering ${BASH_SOURCE[0]:-${(%):-%N}}"

#
sed -i '/#umask 022/a\\necho "entering $(realpath "${BASH_SOURCE[0]}")"' ~/.profile
sed -i '/# for examples/a\\necho "entering $(realpath "${BASH_SOURCE[0]}")"' ~/.bashrc
echo "\nsource ~/.config/dotfiles-core/.linuxbashrc" >> ~/.bashrc

#
sudo apt install -y zsh-autosuggestions xutils-dev                 # xutils-dev : for lndir

#
cp ~/.config/dotfiles-core/copy/.zshrc ~/
chsh -s $(which zsh)

#
command -v brew > /dev/null || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)"

#
source ~/.config/dotfiles-core/one-time-setup.sh
