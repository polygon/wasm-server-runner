{ lib, rustPlatform, fetchCrate, rust-bin }:
rustPlatform.buildRustPackage rec {
  pname = "wasm-server-runner";
  version = "1.0.1";

  src = ./.;

  nativeBuildInputs = [
    rust-bin.stable.latest.minimal
  ];

  cargoLock.lockFile = ./Cargo.lock;
#  cargoHash = "sha256-/a0Vi0HZIdG1XN4YoutjSu291toPVLpfG0ddlUaCcik=";

  meta = with lib; {
    description = "WASM Server runner";
    homepage = "https://crates.io/crates/wasm-server-runner";
    license = licenses.mit;
    maintainers = with maintainers; [ polygon ];
  };
}
