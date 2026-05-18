{ pkgs, ... }:
{
  home.file.".config/nvim/lua".source = ../../../../nvim/lua;
  home.file.".config/nvim/lsp".source = ../../../../nvim/lsp;
  home.file.".config/nvim/snippets".source = ../../../../nvim/snippets;
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    extraConfig = "lua require('configs')";
    extraPackages = with pkgs; [
      ripgrep
      jq

      tree-sitter

      vscode-langservers-extracted # jsonls

      tailwindcss-language-server

      dockerfile-language-server

      bash-language-server

      ccls

      nil

      go
      gopls
      delve

      typescript-language-server

      lua-language-server

      cargo
      rust-analyzer
    ];
    plugins = with pkgs.vimPlugins; [
      netrw-nvim

      nvim-treesitter.withAllGrammars
      nvim-ts-context-commentstring

      fff-nvim

      comment-nvim

      gitsigns-nvim

      blink-cmp

      friendly-snippets

      nvim-lspconfig
      none-ls-nvim

      nvim-dap
      nvim-dap-ui
      nvim-dap-go

      crates-nvim

      typst-preview-nvim

      nvim-web-devicons
      lualine-nvim
      catppuccin-nvim
      nvim-scrollbar
    ];
  };
}
