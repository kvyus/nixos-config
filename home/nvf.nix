{ pkgs, lib, ... }:

{
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        theme = {
          enable = true;
          name = "gruvbox";
          style = "dark";
        };

        languages = {
          clang.enable = true;
          zig.enable = true;
          python.enable = true;
          markdown.enable = true;
          ts.enable = true;
          nix.enable = true;
          lua.enable = true;
          css.enable = true;
          rust.enable = true;
          html.enable = true;
        };

        lsp = {
          enable = true;
        };

        statusline.lualine.enable = true;
        telescope.enable = true;
        autocomplete.nvim-cmp.enable = true;
        autopairs.nvim-autopairs.enable = true;
        visuals.nvim-web-devicons.enable = true;
      };
    };
  };
}
