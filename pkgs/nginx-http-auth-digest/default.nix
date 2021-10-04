{ fetchgit }:

with builtins;

{
  src = fetchgit (fromJSON (readFile ./source.json));
}
