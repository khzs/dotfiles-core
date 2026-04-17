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
if ! command -v ghostty > /dev/null; then
  curl -fsSL https://deb-free.griffo.io/EA0F721D231FDD3A0A17B9AC7808B4DD62C41256.asc \
    | sudo gpg --dearmor --yes -o /etc/apt/keyrings/deb-free.griffo.io.gpg
  echo "deb [signed-by=/etc/apt/keyrings/deb-free.griffo.io.gpg] \
    https://deb-free.griffo.io/apt $(. /etc/os-release; echo ${DEBIAN_CODENAME:-${UBUNTU_CODENAME:-$VERSION_CODENAME}}) main" \
    | sudo tee /etc/apt/sources.list.d/deb-free.griffo.io.list > /dev/null
  sudo apt update
  sudo apt install ghostty -y
fi

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
if ! command -v zed > /dev/null; then
  sudo apt install rsync libasound2t64 -y
  curl -f https://zed.dev/install.sh | sh
fi

#
command -v brew > /dev/null || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)"

#
sudo apt install -y xutils-dev       # for lndir
source ~/.config/dotfiles-core/one-time-setup.sh
