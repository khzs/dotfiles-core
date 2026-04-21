#
echo "entering ${BASH_SOURCE[0]:-${(%):-%N}}"

#
sed -i '/#umask 022/a\\necho "entering $(realpath "${BASH_SOURCE[0]}")"' ~/.profile
sed -i '/# for examples/a\\necho "entering $(realpath "${BASH_SOURCE[0]}")"' ~/.bashrc
echo -e "\nsource ~/.config/dotfiles-core/.linuxbashrc" >> ~/.bashrc

#
sudo apt install -y fzf zoxide zsh-autosuggestions xutils-dev                 # xutils-dev : for lndir

#
cp ~/.config/dotfiles-core/copy/.zshrc ~/
sudo usermod --shell $(which zsh) "$USER"

#
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)"

#
sudo apt install rsync -y
curl -f https://zed.dev/install.sh | sh

#
source ~/.config/dotfiles-core/one-time-setup.sh
