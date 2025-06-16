#
echo "entering ${BASH_SOURCE[0]:-${(%):-%N}}"

#
brew install --cask font-fira-code-nerd-font       # ez asszem a kittyhez kell, vagy a yazihoz
brew install bat micro yazi starship zsh-autosuggestions

#
# echo "entering ${BASH_SOURCE[0]:-${(%):-%N}}" -> .zshrc eleje
echo "source ~/.config/dotfiles-core/.zshrc" >> ~/.zshrc

#
source ~/.config/dotfiles-core/one-time-setup.sh
