# Overlay that provides linux tools
# (geared towards KDE and nixos)
self: super:

{

  mecha-linux = with super.pkgs; super.buildEnv {
    name = "mecha-linux";
    paths =  [
      beets
      chromium
      deadpixi-sam-unstable
      ddrescue
      perl530Packages.ImageExifTool
      f3
      firefox
      filezilla
      fuseiso
      galculator
      ghostscript
      glfw
      glew
      libGLU
      gpa
      gnumake
      gwenview
      ##interception-tools
      imagemagick
      #ipmitool
      #ipmiutil
      joplin-desktop
      kate
      kdeApplications.kio-extras
      kdeApplications.spectacle
      keepassxc
      lftp
      less
      libusb
      lsof
      mupdf
      openjdk
      #pinentry-qt
      #plasma5.breeze-qt5
      scowl
      SDL2
      # p4v
      units
      unrar
      unzip
      weechat
      winePackages.fonts
      winePackages.stable # base wine
      winetricks
      xcape
      xclip
      xsel
      yubioath-desktop
      yubico-piv-tool
    ];
  };
  # FIXME not sure if this is correctly overriding
  # https://nixos.org/nixpkgs/manual/#sec-weechat is how to override it, but makes no mention of being used in an overlay
  #weechat = super.weechat.override {
  #  configure = {availablePlugins, ...}: {
  #    plugins = with availablePlugins; [python perl lua];
  #  };
  #};
}

