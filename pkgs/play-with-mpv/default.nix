{ lib, python3Packages, fetchgit, fetchurl, youtube-dl, git }:

python3Packages.buildPythonApplication rec {
  pname = "play-with-mpv";
  version = builtins.readFile ./version;

  src = fetchgit (builtins.fromJSON (builtins.readFile ./source.json));

  install_freedesktop = fetchurl {
    url = "https://github.com/thann/install_freedesktop/tarball/2673e8da4a67bee0ffc52a0ea381a541b4becdd4";
    sha256 = "0j8d5jdcyqbl5p6sc1ags86v3hr2sghmqqi99d1mvc064g90ckrv";
  };

  nativeBuildInputs = [ git ];
  propagatedBuildInputs = [ youtube-dl ];

  patchPhase = ''
    substituteInPlace setup.py --replace \
    '"https://github.com/thann/install_freedesktop/tarball/master#egg=install_freedesktop-0.2.0"' \
    '"file://${install_freedesktop}#egg=install_freedesktop-0.2.0"'
  '';

  meta = with lib; {
    description = "Chrome extension and python server that allows you to play videos in webpages with MPV instead";
    homepage = "https://github.com/Thann/play-with-mpv";
    license = licenses.mit;
    maintainers = with maintainers; [ dawidsowa ];
  };
}
