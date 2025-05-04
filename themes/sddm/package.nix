{ pkgs }: 

pkgs.stdenv.mkDerivation {
  name = "sddm-theme";
  src = ./.;

  buildInputs = with pkgs.libsForQt5.qt5; [ 
    qtsvg
    qtquickcontrols2
    qtgraphicaleffects
  ];

  installPhase = ''
    mkdir -p $out
    cp -R * $out/
  '';
}

