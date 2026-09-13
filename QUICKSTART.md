# Rust Quickstart — For Bun/JS Devs

> You already have Nix working (`nix develop` shows `Rust dev shell ready`). This is the Rust equivalent of `bun run dev`.

## 1. Enter Dev Shell (Nix)

```bash
cd Rust-Roadmap
nix develop          # enter shell with rustc, cargo, clippy, rustfmt
rustc --version      # verify
cargo --version
```

Exit with `exit`. Every new terminal needs `nix develop` again.

Alternative without entering shell:
```bash
nix develop -c cargo run
nix develop -c cargo check
```

## 2. Create / Init Project

| You know (Bun/JS) | Rust (Cargo) |
|---|---|
| `bun init` | `cargo new my_app` |
| `bun init` in existing folder | `cargo init` |
| `bun add <pkg>` | `cargo add <crate>` |
| `package.json` | `Cargo.toml` |
| `bun.lockb` | `Cargo.lock` |
| `node_modules/` + build | `target/` |

```bash
cargo new my_app              # binary app -> src/main.rs
cargo new my_lib --lib        # library -> src/lib.rs
cargo init                    # init in current folder (like module-2/basic_control_flow)
```

## 3. Run Project — `bun run dev` Equivalent

```bash
cargo run                     # = bun run dev  (debug build + run)
cargo run --release           # = bun run start (optimized)
cargo run -- arg1 arg2        # pass args to your program (note the --)

cargo watch -x run            # auto-reload on save (like --watch)
# first time: cargo install cargo-watch
```

**For web servers (Axum/Rocket/Actix - Module 14):**
```bash
cargo run                     # starts server, e.g. listening on 127.0.0.1:3000
cargo watch -x run            # restart server on file change
```

## 4. Daily Dev Loop

```bash
cargo check                   # fastest check, like `tsc --noEmit` (use while coding)
cargo build                   # compile only -> target/debug/my_app
cargo test                    # = bun test
cargo fmt                     # = prettier / biome format
cargo clippy                  # = eslint (run often!)
```

Order while coding: `check` -> `clippy` -> `test` -> `fmt` -> `run`

## 5. This Repo's Modules

Each module already is a cargo project, e.g.:

```bash
cd module-2/basic_control_flow
nix develop -c cargo run

cd ../../module-3/data_collection
nix develop -c cargo run
```

No `npm install` needed — `cargo run` fetches deps automatically from `Cargo.toml`.

## 6. Dependencies

```bash
cargo add serde --features derive   # add dep
cargo add tokio --features full     # async runtime (like adding hono/express)
cargo remove serde
cargo update                        # update within semver
cargo tree                          # see dep tree
```

Edit `Cargo.toml` directly also works:
```toml
[dependencies]
serde = { version = "1", features = ["derive"] }
tokio = { version = "1", features = ["full"] }
axum = "0.7"
```

## 7. Useful One-Liners

```bash
cargo clean                   # delete target/ (like rm -rf dist node_modules/.cache)
cargo doc --open              # open docs in browser
cargo fmt && cargo clippy && cargo test  # pre-commit check
```

## 8. Bun vs Cargo Mental Model

```
bun run dev     -> cargo run
bun run dev --watch -> cargo watch -x run
bun x <tool>    -> cargo run --bin <name> / cargo install <tool>
bun test        -> cargo test
bun add         -> cargo add
```

No `dev` script needed — Rust binaries *are* the server. `cargo run` compiles and starts it.

---
Fix Nix not found? `nix --version` should work. If not, reload shell: `source ~/.nix-profile/etc/profile.d/nix.sh`
