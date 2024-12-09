{

  description = "Nushell and related tooling";

  inputs = {

    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  };

  outputs = { self, nixpkgs }: let

    system = "x86_64-linux";

    pkgs = import nixpkgs { inherit system; };

  in {

    packages.${system}.default = pkgs.buildEnv {

      name = "global-packages";

      paths = with pkgs; [

        # languages
        nushell
        starship
        nufmt

        # Plugins
        nushellPlugins.formats
        nushellPlugins.polars
        nushellPlugins.skim






      ];

    };

  };

}
