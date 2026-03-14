#
echo "entering ${BASH_SOURCE[0]:-${(%):-%N}}"

#
brew install zsh-autosuggestions

#
# echo "entering ${BASH_SOURCE[0]:-${(%):-%N}}" -> .zshrc eleje
echo "\nsource ~/.config/dotfiles-core/.darwinzshrc" >> ~/.zshrc

#
source ~/.config/dotfiles-core/one-time-setup.sh
