#
echo "entering ${BASH_SOURCE[0]:-${(%):-%N}}"

#
patch --forward --reject-file=- ~/.bashrc ~/.config/dotfiles-core/copy/bashrc.patch

#
sudo apt install -y fzf zoxide

#
sudo apt install -y zsh-autosuggestions
sudo usermod --shell $(which zsh) "$USER"
touch ~/.zshrc-local
ln -s ~/.config/dotfiles-core/.linuxzshrc ~/.zshrc

#
if ! command -v bcompare > /dev/null; then
  wget https://www.scootersoftware.com/DEB-GPG-KEY-scootersoftware.asc
  sudo mv DEB-GPG-KEY-scootersoftware.asc /etc/apt/trusted.gpg.d/
  wget https://www.scootersoftware.com/scootersoftware.list
  sudo mv scootersoftware.list /etc/apt/sources.list.d/
  sudo apt update
  sudo apt install bcompare -y
fi

#
sudo apt install rsync libasound2t64 -y
command -v zed > /dev/null || curl -f https://zed.dev/install.sh | sh

#
command -v brew > /dev/null || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)"

#
sudo apt install -y xutils-dev       # for lndir
source ~/.config/dotfiles-core/one-time-setup.sh
