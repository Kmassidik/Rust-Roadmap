# 🦀 Rust-Roadmap

My own from-scratch Rust learning repo — structured notes, practice challenges, and
actual apps as I go, all in one place.

## Layout

| Folder / File | What's in it |
|---|---|
| [`Roadmap-module/`](./Roadmap-module) | The full curriculum — 21 modules, one topic per `.md` file, structured from a PDF roadmap. Start here for the actual learning material. |
| [`Code-challange/`](./Code-challange) | Small coding challenges/exercises as I work through the roadmap. |
| [`Apps-project/`](./Apps-project) | Real, buildable apps/projects — where the modules' "Project N" ideas actually get built. |
| [`QUICKSTART.md`](./QUICKSTART.md) | Rust cheat sheet aimed at devs coming from Bun/JS — Nix shell, `cargo` basics, mental-model mapping. |
| [`Shortcut.md`](./Shortcut.md) | Cargo command quick reference. |
| [`flake.nix`](./flake.nix) | Nix dev shell — `rustc`, `cargo`, `clippy`, `rustfmt`, plus the native libs modules 16-21 need (openssl, sqlite, postgresql, wasm-pack, gtk3). |

## Getting started

```bash
nix develop     # drop into the dev shell (see flake.nix)
rustc --version # confirm you're in it
```

Then head into [`Roadmap-module/README.md`](./Roadmap-module/README.md) for the module list.
