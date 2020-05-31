{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.packages = let
    games = with pkgs; [
      gzdoom
      timidity
      soundfont-fluid
      freepats
      crispyDoom
      tor-browser-bundle-bin
      qbittorrent
    ];
    dev = with pkgs; [
      guile
      p7zip
      mcron
      emacs
      git
      opam
    ];
    admin = with pkgs; [
      remmina
      nixops
      llpp
      rsync
      rclone
    ];
  in with pkgs; [
  ] ++ games ++ dev ++ admin;

  xresources.properties = {
    "XTerm*vt100.foreground" = "white";
    "XTerm*vt100.background" = "black";
    "XTerm*vt100.faceName" = "DejaVu Sans Mono:size=12:style=Bold";	
    "XTerm*vt100.metaSendsEscape" = "true";
  };

  programs.bash = {
    enable = true;
    sessionVariables = {
      HM_CONFIG = "$HOME/.config/nixpkgs";
    };
    shellAliases = {
      vihome = "vi $HOME/.config/nixpkgs/home.nix";
    };
  };

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    extraConfig = ''
      set nu
      colorscheme gruvbox
    '';
    plugins = with pkgs; [
      # Syntax hightlighting for .nix files
      vimPlugins.vim-nix
      vimPlugins.gruvbox
    ];
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "20.03";
}
