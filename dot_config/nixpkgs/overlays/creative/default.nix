# Overlay that provides creative tools
# video, 3D, audio, content-creation
self: super:

{
  mecha-creative = with super.pkgs; super.buildEnv {
    name = "mecha-creative";
    paths =  [
      audacity
      # avidemux # 23.11 : 'marked as broken'
      blender
      dvdauthor
      dvdbackup
      gifski
      libheif
      glxinfo
      #glimpse
      gimp-with-plugins
      gst_all_1.gstreamer
      handbrake
      libdvdcss
      libisofs
      qjackctl
      shotcut
      vlc
    ];
  };
}


