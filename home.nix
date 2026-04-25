{ pkgs, lib, ... }:

let
  init = ''
    echo "entering ${BASH_SOURCE[0]:-${(%):-%N}}"
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  '';
in
{
  # Required for standalone Home Manager on non-NixOS systems (Fedora, Debian, etc.)
  targets.genericLinux.enable = true;

  home = {
    stateVersion = "23.11";
    username = lib.mkDefault (builtins.getEnv "USER");
    homeDirectory = lib.mkDefault (builtins.getEnv "HOME");

    packages = with pkgs; [
      rsync zed-editor
    ];
  };

  programs = {
    home-manager.enable = true;

    fzf.enable = true;
    zoxide = {
      enable = true;
      enableZshIntegration = true;
      enableBashIntegration = true;
      options.cmd = "cd";
    };

    bash = {
      enable = true;
      bashrcExtraLast = init + ''
        source ~/.config/dotfiles-core/.linuxbashrc
      '';
    };

    zsh = {
      enable = true;
      autosuggestion.enable = true;
      initExtraLast = init + ''
        source ~/.config/dotfiles-core/.linuxzshrc
      '';
    };

    git = {
      enable = true;
      extraConfig = {
        core.editor = "micro";
        pull.rebase = true;
        push.autoSetupRemote = true;
      };
    };
  };
}
