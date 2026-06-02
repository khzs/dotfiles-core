#
echo "entering ${BASH_SOURCE[0]:-${(%):-%N}}"

#
git config --global core.editor "micro"
git config --global pull.rebase true
git config --global push.autoSetupRemote true
git config --global core.excludesFile ~/.gitignore_global

# symlink
lndir ~/.config/dotfiles-core/config-overlay ~/.config
[ ! -f ~/.gitignore_global ] && cp ~/.config/dotfiles-core/copy/.gitignore_global.base ~/.gitignore_global
[ ! -f ~/.config/fresh/config.json ] && mkdir -p ~/.config/fresh && cp ~/.config/dotfiles-core/copy/fresh.base ~/.config/fresh/config.json
[ ! -f ~/.config/ghostty/config.ghostty ] && mkdir -p ~/.config/ghostty && cp ~/.config/dotfiles-core/copy/ghostty.base ~/.config/ghostty/config.ghostty
[ ! -f ~/.config/zed/settings.json ] && mkdir -p ~/.config/zed && cp ~/.config/dotfiles-core/copy/zed.base ~/.config/zed/settings.json

#
brew install --cask font-adwaita-mono-nerd-font      # Mono = basic; Mono ... Mono = smaller icons in yazi
HOMEBREW_NO_CLEANUP_FORMULAE=pi-coding-agent brew install bat micro yazi starship midnight-commander lazygit fresh-editor pi-coding-agent -y
pi install npm:pi-web-access
mkdir ~/.pi/agent/extensions/
cp copy/exit-alias.ts ~/.pi/agent/extensions/
cp copy/auth-with-sudo.ts ~/.pi/agent/extensions/
