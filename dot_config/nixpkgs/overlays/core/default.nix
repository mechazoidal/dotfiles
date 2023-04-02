# Overlay that provides baseline tools
self: super:

{
  mecha-core = with super.pkgs; super.buildEnv {
    name = "mecha-core";
    paths =  [
      age
      # ark # kde qt5 breezedecoration
      bat
      bc
      chezmoi
      direnv
      doxygen
      fd
      ffmpeg
      fzf
      graphviz
      git
      jq
      neovim
      niv
      nmap
      mercurial
      mpv
      mumble
      #nixos.openssl
      openssl
      parallel
      rcm
      ripgrep
      screen
      shellcheck
      silver-searcher
      signify
      socat
      sox
      timewarrior
      vimHugeX # only way to get xterm_clipboard
      wordnet
      # youtube-dl # easier just to maintain a separate nix-shell
      zip
      zoxide
    ];
  };
}
