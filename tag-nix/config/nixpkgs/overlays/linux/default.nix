# Overlay that provides linux tools
# (geared towards KDE)
self: super:

{
  mecha-linux = with super.pkgs; super.buildEnv {
    name = "mecha-linux";
    paths =  [
      firefox
      galculator
      gwenview
      # interception-tools
      kate
      kdeApplications.kio-extras
      mupdf
      less
      lsof
      units
      unrar
      unzip
      winePackages.stable # base wine
      winePackages.fonts
      winetricks
      xcape
      xclip
      xsel
    ];
  };
}

