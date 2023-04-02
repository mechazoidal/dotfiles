# Overlay that provides creative tools
# video, 3D, audio, content-creation
self: super:

{
  mecha-creative = with super.pkgs; super.buildEnv {
    name = "mecha-creative";
    paths =  [
      audacity
      avidemux
      blender
      dvdauthor
      dvdbackup
      glxinfo
      #glimpse
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


