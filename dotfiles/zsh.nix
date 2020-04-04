{ config, pkgs, ...}:
{
  programs.zsh.enable = true;
  programs.zsh.enableCompletion = true;
  programs.zsh.enableAutosuggestions = true;
  programs.zsh.autocd = true;
#programs.zsh.defaultKeymap = "vicmd";
  programs.zsh.history.extended = true;
  programs.zsh.history.ignoreDups = true;
  programs.zsh.history.path = ".zsh_history";
  programs.zsh.history.save = 10000000;
  programs.zsh.history.share = true;
  programs.zsh.history.size = 10000000;
  programs.zsh.oh-my-zsh.enable = true;
  programs.zsh.oh-my-zsh.plugins = [ "git" "sudo" "z" ];

# aliases
  programs.zsh.shellAliases = {
    "ll" = "ls -l";
    ".." = "cd ..";
    "query" = "nix-store --query --requisites /run/current-system | cut -d- -f2- | sort -u";
    "hb" = "home-builder switch";
    "build_root" = "sudo nixos-rebuild switch";
    "query_vim_pkgs" = "nix-env -f '<nixpkgs>' -qaP -A vimPlugins";
    "gen_wal" = "wal --backend wal --iterative -i $HOME/Downloads/wallpapers/Future/";
    "delete_gens" = "nix-env -p /nix/var/nix/profiles/system --delete-generations old";
    "list_gens" = "nix-env -p /nix/var/nix/profiles/system --list-generations";
    "spawn_docker" = "docker run --rm -it -m=\"12G\" --memory-swap=\"0G\" --mount type=bind,src=$HOME/work,dst=/work bap:latest /bin/bash";
    "start_nix_shell" = "nix-shell --pure -E 'with import<nixpkgs> {}; callPackage ./. {}";
    "alacritty_x" = "env WINIT_UNIX_BACKEND=x11 alacritty & disown && exit";
    "nu" = "sudo NIXOS_CONFIG=$HOME/.config/nixpkgs/configuration.nix nixos-rebuild switch";
    # run lorri
    "rl" = "lorri init && direnv allow";
    "cdh" = "cd $HOME";
    "emacs_headless" = "emacs -nw";
    "zathura" = "zathura_pwyal.sh";
  };
  # keys.sh contains a bunch of my keys
  programs.zsh.initExtra = builtins.readFile ./keys.sh + builtins.readFile ./zshrc;
  programs.zsh.oh-my-zsh.theme = "robbyrussell";
  programs.zsh.plugins =
    [
    {
      name = "fast-syntax-highlighting";
      src = pkgs.fetchFromGitHub {
        owner = "zdharma";
        repo = "fast-syntax-highlighting";
        rev = "303eeee81859094385605f7c978801748d71056c";
        sha256 = "0y0jgkj9va8ns479x3dhzk8bwd58a1kcvm4s2mk6x3n19w7ynmnv";
      };
    }
  {
    name = "fzf-z";
    src = pkgs.fetchFromGitHub {
      owner = "andrewferrier";
      repo = "fzf-z";
      rev = "2db04c704360b5b303fb5708686cbfd198c6bf4f";
      sha256 = "1ib98j7v6hy3x43dcli59q5rpg9bamrg335zc4fw91hk6jcxvy45";
    };
  }
  {
    name = "fzf-z";
    src = pkgs.fetchFromGitHub {
      owner = "andrewferrier";
      repo = "fzf-z";
      rev = "2db04c704360b5b303fb5708686cbfd198c6bf4f";
      sha256 = "1ib98j7v6hy3x43dcli59q5rpg9bamrg335zc4fw91hk6jcxvy45";
    };
  }
  /*{*/
    /*name = "zsh-nix-shell";*/
    /*src = pkgs.fetchFromGitHub {*/
      /*owner = "chisui";*/
      /*repo = "zsh-nix-shell";*/
      /*rev = "a65382a353eaee5a98f068c330947c032a1263bb";*/
      /*sha256 = "0l41ac5b7p8yyjvpfp438kw7zl9dblrpd7icjg1v3ig3xy87zv0n";*/
    /*};*/
  /*}*/
  ];

}