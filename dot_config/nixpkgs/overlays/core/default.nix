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
      # chezmoi # use unstable.chezmoi instead until 2.0+ is in stable
      direnv
      doxygen
      fd
      ffmpeg
      # ffmpegthumbs # kde qt5 breezedecoration
      fzf
      graphviz
      git
      jq
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
      vim
      wordnet
      youtube-dl
      zip
      # zoxide # use unstable.zoxide instead
    ];
  };
}
