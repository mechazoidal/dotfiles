# Overlay that provides languages & tools
self: super:

{
  mecha-developer = with super.pkgs; super.buildEnv {
    name = "mecha-developer";
    paths =  [
      python3
      ruby
      go
    ];

  };
}
