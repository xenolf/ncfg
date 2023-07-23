{
  description = "My fabulous config";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    # Home manager
    home-manager = { url = "github:nix-community/home-manager/release-23.05"; inputs.nixpkgs.follows = "nixpkgs"; };
    # nix utils
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { nixpkgs, home-manager, utils, ... }@inputs:
  let 
    pkgsForSystem = system: import nixpkgs {
      overlays = [
      ];
      inherit system;
      config.allowUnfree = true;
    };

    mkHomeConfiguration = args: home-manager.lib.homeManagerConfiguration (rec {
      pkgs = pkgsForSystem (args.system or "x86_64-linux");
    } // { inherit (args) extraSpecialArgs modules; });
  in utils.lib.eachSystem [ "x86_64-linux" "aarch64-darwin"] (system: rec {
    legacyPackages = pkgsForSystem system;
  }) // {
    # NixOS configuration entrypoint
    # Available through 'nixos-rebuild --flake .#your-hostname'
    nixosConfigurations = {
      # FIXME replace with your hostname
      your-hostname = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; }; # Pass flake inputs to our config
        # > Our main nixos configuration file <
        modules = [ ./nixos/configuration.nix ];
      };
    };

    # Standalone home-manager configuration entrypoint
    # Available through 'home-manager --flake .#your-username@your-hostname'
    homeConfigurations = {
      "root@vmpod" = mkHomeConfiguration {
        modules = [ ./home-manager/vmpod-home.nix ];
        extraSpecialArgs = {
          inherit inputs;
        };
      };
      "azhwkd@havok" = mkHomeConfiguration {
        modules = [ ./home-manager/havok.nix ];
        extraSpecialArgs = {
          inherit inputs;
        };
      };
    };
  };
}
