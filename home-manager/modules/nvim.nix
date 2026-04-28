{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    withPython3 = false;
    withRuby = false;

    extraPackages = with pkgs; [
      lua-language-server
      nixd
      gcc
      ripgrep
      fd
      tree-sitter
      # если нужен Python LSP, попробуй сначала так:
      python3Packages.python-lsp-server
    ];
  };

  home.file.".config/nvim".source = ../nvim;
}
