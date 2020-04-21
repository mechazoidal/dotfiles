# Overlay that provides baseline tools
self: super:

{
  core = with super.pkgs; super.buildEnv {
    name = "mecha-core";
    paths =  [
      ark
      bc
      curl
      direnv
      dtrx
      ffmpeg
      ffmpegthumbs
      fzf
      ghostscript
      git
      gnupg
      jq
      keepassxc
      mpv
      mumble
      openssl
      parallel
      rcm
      ripgrep
      screen
      shellcheck
      silver-searcher
      socat
      sox
      tig
      timewarrior
      tree
      wget
      wordnet
      zip
    ];
  };
}
