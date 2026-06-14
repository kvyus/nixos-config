{
   description = "flake";

   inputs = {
      nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
      nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
      nvf.url = "github:notashelf/nvf";
      home-manager = {
         url = "github:nix-community/home-manager";
         inputs.nixpkgs.follows = "nixpkgs";
      }; 
      hyprland.url = "github:hyprwm/Hyprland";
      spicetify-nix.url = "github:Gerg-L/spicetify-nix";
      helium.url = "gitlab:ntgn/helium-flake";
      stylix.url = "github:danth/stylix";
      mangowm = {
         url = "github:mangowm/mango";
         inputs.nixpkgs.follows = "nixpkgs";
      };
   };

   outputs = { nixpkgs, home-manager, ... } @inputs: {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
         specialArgs = { inherit inputs; };
         modules = [
            ./nixos/configuration.nix
            inputs.nix-flatpak.nixosModules.nix-flatpak
            inputs.helium.nixosModules.helium
            inputs.stylix.nixosModules.stylix
         ];
      };		
      homeConfigurations."cherv" = home-manager.lib.homeManagerConfiguration {
         extraSpecialArgs = { inherit inputs; };
         pkgs = nixpkgs.legacyPackages.x86_64-linux;
         modules = [
            inputs.nvf.homeManagerModules.default
            inputs.spicetify-nix.homeManagerModules.default
            inputs.helium.homeModules.helium
            inputs.stylix.homeModules.stylix
            inputs.mangowm.hmModules.mango
            ./home/home.nix
         ];
      };
   };
}
