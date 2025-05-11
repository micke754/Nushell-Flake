{

  description = "Nushell and related tooling";

  inputs = {

    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  };

  outputs = { self, nixpkgs }: let

    system = "aarch64-darwin";

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
        nushellPlugins.polars

      ];

    };

  };

}
