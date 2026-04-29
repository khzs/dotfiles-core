#
echo "entering ${BASH_SOURCE[0]:-${(%):-%N}}"

#
git config --global core.editor "micro"
git config --global pull.rebase true
git config --global push.autoSetupRemote true

# symlink
lndir ~/.config/dotfiles-core/config-overlay ~/.config

#
uname -r | grep WSL   || brew install --cask font-jetbrains-mono-nerd-font      # yazihoz es starshiphez biztosan kell, asszem kittyhez is; MonoNL = No Ligatures; MonoNL ... Mono = smaller icons in yazi
brew install bat micro yazi starship midnight-commander lazygit
