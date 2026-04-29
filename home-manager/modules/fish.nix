{ pkgs, ... }:

{
  programs.fish = {
    enable = true;

    functions = {
      fish_prompt = {
        description = "Write out the prompt";
        body = ''
          printf '%s@%s %s%s%s > ' $USER $hostname \
            (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
        '';
      };
    };

    shellInit = ''
      fish_add_path $HOME/.spicetify
    '';

    interactiveShellInit = ''
      set -g fish_greeting 
      set -U fish_color_autosuggestion 555
      set -U fish_color_cwd green
      set -U fish_color_valid_path normal
      ${pkgs.fastfetch}/bin/fastfetch
    '';

    shellAliases = {
      ll = "ls -l";
      rebuild = "sudo nixos-rebuild switch";
    };
  };
}
