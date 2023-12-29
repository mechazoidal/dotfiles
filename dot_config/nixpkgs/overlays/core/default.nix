# Overlay that provides baseline tools
self: super:

{
  mecha-core = with super.pkgs; super.buildEnv {
    name = "mecha-core";
    paths =  [
      afew
      age
      # ark # kde qt5 breezedecoration
      bat
      bc
      chezmoi
      direnv
      doxygen
      fd
      # ffmpeg
      ffmpeg_6-full
      # ffmpegthumbs # kde qt5 breezedecoration
      fzf
      graphviz
      git
      jq
      isync
      neovim
      niv
      nmap
      mercurial
      mpv
      mumble
      notmuch
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
