# Overlay that provides baseline tools
self: super:

{
  mecha-office = with super.pkgs; super.buildEnv {
    name = "mecha-office";
    paths =  [
      calibre
      # digikam
      #libreoffice-qt
      pandoc
      pdftk
      skanlite
    ];
  };
}

