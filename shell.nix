(import (
  fetchTarball https://github.com/edolstra/flake-compat/archive/master.zip
) {
  src =  ./.;
}).shellNix

