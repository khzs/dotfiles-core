# Modern Nix Setup (Non-NixOS)

This configuration is designed for standalone usage on non-NixOS systems (e.g., Fedora, Debian). It uses **Home Manager** to manage your environment declaratively while coexisting with **Homebrew**.

## Key Design Choices

1.  **Generic Linux Support**: Enabled `targets.genericLinux.enable = true` to ensure compatibility with non-NixOS distributions.
2.  **Homebrew Integration**:
    *   Packages managed by Brew (`bat`, `micro`, `yazi`, `starship`, `mc`, `lazygit`, etc.) are **not** installed by Nix to avoid conflicts.
    *   Nix still manages the **configuration files** for these tools via `xdg.configFile`.
    *   Shell profiles (`.bashrc`, `.zshrc`) automatically initialize the Brew environment if found in `/home/linuxbrew/.linuxbrew`.
3.  **Self-Contained Flake**: The `config-overlay` directory has been moved into this repository. This allows the Flake to be truly portable and reproducible without depending on external symlinks.

## How to Apply

To apply this configuration, run:

```bash
nix run home-manager -- switch --flake .
```

## Managed by installscript (!!!!!!!!!!!!!!!!!!!!todo!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!)
- lndir
- apt install nix
- brew install

## Managed by Nix
- `fzf`, `zoxide`, `rsync`, `zed-editor`
- Shell configurations (`bash`, `zsh`)
- Git global settings

## Managed by Brew
- `bat`, `micro`, `yazi`, `starship`, `mc`, `lazygit`
- Fonts (Adwaita Mono Nerd Font)






## todo

nem tudom, hogy jól szedtem-e szét

brew csomagokat vissza kéne rakni? vagy mi a faszt csináljak?





     36 -                 # From one-time-setup.sh (Brew equivalents)
      37 -                 bat
      38 -                 micro
      39 -                 yazi
      40 -                 starship
      41 -                 mc # midnight-commander
      42 -                 lazygit
      36
      ════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
      44 -                 # Fonts
      45 -                 (nerdfonts.override { fonts = [ "Adwaita" ]; })
