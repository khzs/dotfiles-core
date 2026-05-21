#
echo "entering ${BASH_SOURCE[0]:-${(%):-%N}}"

#
brew install zsh-autosuggestions wget yt-dlp ffmpeg fzf zoxide
ln -s "/Applications/Beyond Compare.app/Contents/MacOS/bcomp" ~/.local/bin/bcompare
ln -s "/Applications/Zed.app/Contents/MacOS/cli" ~/.local/bin/zed

if [ ! -f ~/Library/LaunchAgents/com.user.keyswap.plist ]; then
  curl -fsSL https://raw.githubusercontent.com/khzs/keyboard-everything/main/com.user.keyswap.plist -o ~/Library/LaunchAgents/com.user.keyswap.plist
  launchctl bootstrap gui/$(id -u) ~/Library/LaunchAgents/com.user.keyswap.plist
fi

#
# echo "entering ${BASH_SOURCE[0]:-${(%):-%N}}" -> .zshrc eleje
# echo "\nsource ~/.config/dotfiles-core/.darwinzshrc" >> ~/.zshrc

#
source ~/.config/dotfiles-core/one-time-setup.sh
