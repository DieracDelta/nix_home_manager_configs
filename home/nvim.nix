{ config, pkgs, lib, ... }:
let
  cfg = config.profiles.vim;
in
{
  options.profiles.vim.enable =
    lib.mkOption {
      description = "Enable custom vim configuration.";
      type = with lib.types; bool;
      default = true;
    };

  config = lib.mkIf cfg.enable {
    xdg.configFile."nvim/coc-settings.json".source = ./coc-settings.json;
    programs.neovim = {
      enable = true;
      package = pkgs.neovim-nightly;
      extraConfig = builtins.readFile ./init.vim;
      extraPython3Packages = (ps: with ps; [ jedi flake8 pep8 ]);
      plugins = with pkgs.vimPlugins; [
        fugitive
        vim-illuminate
        neodark-vim
        gitgutter
        rainbow
        fzf-vim
        fzfWrapper
        vim-better-whitespace
        vim-polyglot
        vim-surround
        vim-airline
        vim-gutentags
        bclose-vim
        indentLine
        nerdcommenter
        vim-speeddating
        vim-textobj-variable-segment
        vim-textobj-user
        vim-eunuch
        ultisnips
        vim-snippets
        vimtex
        delimitMate
        wal-vim
        vim-sandwich
        vim-addon-nix
        coc-nvim
        coc-python
        coc-emmet
        /*pkgset.unstable-pkgs.*/
        pkgs.unstable.vimPlugins.coc-diagnostic
      ];
      viAlias = true;
      vimAlias = true;
      withNodeJs = true;
      withPython3 = true;
      withRuby = true;
    };
  };

}