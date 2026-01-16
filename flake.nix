{
  description = "My personal NUR";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    oxalica.url = "github:oxalica/rust-overlay/stable";
  };

  outputs = { self, nixpkgs, oxalica }:
    let
      overlays = [ (import oxalica) ];
      pkgs = import nixpkgs {
        system = "x86_64-linux";
        inherit overlays;
      };
    in
    {
      packages.x86_64-linux.wasm-server-runner = pkgs.callPackage ./wasm-server-runner.nix { };

      devShells.x86_64-linux.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          rust-bin.stable.latest.default
        ];
      };
    };
}
