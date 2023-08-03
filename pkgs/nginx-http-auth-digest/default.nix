{ fetchgit }:

with builtins;

{
  name = "http-auth-digest";
  src = fetchgit (fromJSON (readFile ./source.json));
  meta = {
    description = "Nginx Digest Authentication module";
    homepage = "https://github.com/atomx/nginx-http-auth-digest";
    license = [];
  };
}
