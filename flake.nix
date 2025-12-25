{
  description = "Home Manager + NVF setup + spicetify";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    nvf.url = "github:notashelf/nvf";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
  };

  outputs = inputs @ { self, nixpkgs, home-manager, nvf, spicetify-nix, nix-flatpak, ... } : 
  let
    system = "x86_64-linux";
  in
  {
    nixosConfigurations.nixtyashke = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [ 
        ./nixos/configuration.nix
        nix-flatpak.nixosModules.nix-flatpak
      ];
    };
    homeConfigurations."unvoid" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      modules = [
        nvf.homeManagerModules.default
        ./home/home.nix
        {
          _module.args = {
            inherit spicetify-nix;
          };
        }
        spicetify-nix.homeManagerModules.default
      ];
    };

  };
}


