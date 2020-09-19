{ stdenv, fetchFromGitHub
, meson, ninja, pkgconfig
, wayland, wayland-protocols
}:

stdenv.mkDerivation rec {
  name = "wl-clipboard-x11";
  src = fetchFromGitHub {
    owner = "brunelli";
    repo = "wl-clipboard-x11";
    rev = "37729fc0197ae88b545024be58bb13ecf449a683";
    sha256 = "1y7jv7rps0sdzmm859wn2l8q4pg2x35smcrm7mbfxn5vrga0bslb";
  };

  dontBuild = true;
  installPhase = ''
    export PREFIX=$out
    make install
  '';

}
