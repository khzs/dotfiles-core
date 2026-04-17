#
echo "entering ${BASH_SOURCE[0]:-${(%):-%N}}"

#
brew install zsh-autosuggestions fzf zoxide
ln -s "/Applications/Beyond Compare.app/Contents/MacOS/bcomp" ~/.local/bin/bcompare
ln -s "/Applications/Zed.app/Contents/MacOS/cli" ~/.local/bin/zed

#
# echo "entering ${BASH_SOURCE[0]:-${(%):-%N}}" -> .zshrc eleje
echo "\nsource ~/.config/dotfiles-core/.darwinzshrc" >> ~/.zshrc

#
source ~/.config/dotfiles-core/one-time-setup.sh
