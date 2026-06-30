{
  description = "Home Manager configuration of taka";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # tirith: ターミナルセキュリティ監視（外部 flake、nixpkgs 未収録）
    tirith = {
      url = "github:sheeki03/tirith";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, home-manager, tirith, ... }:
    let
      system = "x86_64-linux";

      # Import nixpkgs with unfree packages allowed
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };
    in
    {
      homeConfigurations."taka" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [ ./home.nix ];

        # tirith パッケージを home.nix へ受け渡す
        extraSpecialArgs = {
          tirith = tirith.packages.${system}.default;
        };
      };
    };
}
