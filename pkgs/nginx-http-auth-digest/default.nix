{ fetchgit }:

with builtins;

{
  name = "http-auth-digest";
  src = fetchgit (fromJSON (readFile ./source.json));
}
