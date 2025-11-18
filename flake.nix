{
  description = "Home Manager + NVF setup + spicetify";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    nvf.url = "github:notashelf/nvf";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
  };

  outputs = { self, nixpkgs, home-manager, nvf, spicetify-nix ,... } : {
    homeConfigurations."unvoid" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      modules = [
        nvf.homeManagerModules.default
        ./home.nix
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


