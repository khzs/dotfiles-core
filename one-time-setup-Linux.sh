#
echo "entering ${BASH_SOURCE[0]:-${(%):-%N}}"

#
sed -i '/#umask 022/a\\necho "entering $(realpath "${BASH_SOURCE[0]}")"' ~/.profile
sed -i '/# for examples/a\\necho "entering $(realpath "${BASH_SOURCE[0]}")"' ~/.bashrc
echo -e "\nsource ~/.config/dotfiles-core/.linuxbashrc" >> ~/.bashrc

#
sudo apt install -y fzf zoxide

#
sudo apt install -y zsh-autosuggestions
cp ~/.config/dotfiles-core/copy/.zshrc ~/
sudo usermod --shell $(which zsh) "$USER"

#
sudo apt install rsync libasound2t64 -y
command -v zed > /dev/null || curl -f https://zed.dev/install.sh | sh

#
command -v brew > /dev/null || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)"

#
sudo apt install -y xutils-dev       # for lndir
source ~/.config/dotfiles-core/one-time-setup.sh
