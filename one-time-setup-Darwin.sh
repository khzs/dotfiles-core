#
echo "entering ${BASH_SOURCE[0]:-${(%):-%N}}"

#
brew install zsh-autosuggestions fzf zoxide
ln -s "/Applications/Beyond Compare.app/Contents/MacOS/bcomp" ~/.local/bin/bcompare

#
# echo "entering ${BASH_SOURCE[0]:-${(%):-%N}}" -> .zshrc eleje
echo "\nsource ~/.config/dotfiles-core/.darwinzshrc" >> ~/.zshrc

#
source ~/.config/dotfiles-core/one-time-setup.sh
