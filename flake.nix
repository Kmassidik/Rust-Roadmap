{
  description = "Rust dev environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            rustc
            cargo
            clippy
            rustfmt

            # native deps for crates covered in module-16..21
            pkg-config
            openssl        # reqwest/hyper native-tls, rustls-adjacent build deps
            sqlite         # rusqlite
            postgresql     # libpq, for diesel/sqlx postgres backends

            # module-21 WASM
            wasm-pack
            binaryen

            # module-21 GUI (gtk-rs/relm) — tauri needs more (webkit2gtk etc.),
            # add those ad hoc when you actually get to it
            gtk3
          ];

          shellHook = ''
            echo "Rust dev shell ready — $(rustc --version)"
          '';
        };
      });
}
