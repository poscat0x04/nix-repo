{ stdenvNoCC }:

stdenvNoCC.mkDerivation {
  pname = "jhwhw-tex";
  name = "jhwhw-tex";
  passthru.tlType = "run";

  phases = "installPhase";

  installPhase = ''
    install -Dm644 ${./jhwhw.cls} $out/tex/latex/jhwhw/jhwhw.cls
  '';
}
