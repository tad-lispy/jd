{
  description = "JSON diff and patch";

  outputs = { self, nixpkgs }: {

    packages.x86_64-linux.hello =
      with import nixpkgs { system = "x86_64-linux"; };
      buildGoModule rec {
        pname = "jd";
        version = "1.3";

        src = self;

        vendorSha256 = "sha256-w3mFra7Je+8qIDQMSyUYucoLZ6GtrZmr56O6xmihIYc=";
        subPackages = [ "." ];
        meta = with lib; {
          description = "JSON diff and patch";
          homepage = "https://github.com/josephburnett/jd/";
          license = licenses.mit;
          platforms = platforms.linux ++ platforms.darwin;
        };
      };

    defaultPackage.x86_64-linux = self.packages.x86_64-linux.hello;
  };
}
