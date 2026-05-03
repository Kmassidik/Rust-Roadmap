## Cargo Quick Reference — Rust Build Tool

No worries, here's a clean cheat sheet to get you back up to speed.

### Project Lifecycle

bash

```bash
cargo new my_app           # new binary project (creates folder + git init)
cargo new my_lib --lib     # new library project
cargo init                 # init cargo in an existing folder
```

### Build & Run

bash

```bash
cargo run                  # compile + run (debug mode)
cargo run --release        # compile + run (optimized, slower compile)
cargo run -- arg1 arg2     # pass args to YOUR program (after --)
cargo build                # compile only → target/debug/
cargo build --release      # optimized build → target/release/
cargo check                # type-check without producing binary (fast!)
```

`cargo check` is your best friend during development — way faster than `cargo build` because it skips codegen.

### Testing & Quality

bash

```bash
cargo test                 # run all tests
cargo test some_name       # run tests matching "some_name"
cargo test -- --nocapture  # show println! output during tests
cargo bench                # run benchmarks (nightly or criterion)
```

### Code Hygiene

bash

```bash
cargo fmt                  # auto-format (rustfmt)
cargo clippy               # linter — catches idiom issues, run this often
cargo clippy -- -D warnings  # treat warnings as errors (CI-style)
cargo fix                  # apply compiler-suggested fixes automatically
```

### Dependencies

bash

```bash
cargo add serde            # add a crate to Cargo.toml
cargo add tokio --features full     # add with feature flags
cargo add serde --features derive
cargo remove serde         # remove a crate
cargo update               # update dependencies per Cargo.toml rules
cargo tree                 # show dependency tree
cargo tree -d              # show duplicate deps (version conflicts)
```

### Docs & Inspection

bash

```bash
cargo doc --open           # build + open docs for your crate AND deps
cargo expand               # show macro-expanded code (needs install)
cargo clean                # nuke target/ directory
```

### Project Structure (after `cargo new`)

```
my_app/
├── Cargo.toml            # manifest (deps, metadata)
├── Cargo.lock            # exact dep versions (commit for bins, not libs)
├── src/
│   ├── main.rs           # binary entry point
│   └── lib.rs            # library entry point (if --lib)
└── target/               # build artifacts (gitignored)
```

### Cargo.toml Anatomy

toml

```toml
[package]
name = "my_app"
version = "0.1.0"
edition = "2024"           # latest edition as of 2026

[dependencies]
serde = { version = "1", features = ["derive"] }
tokio = { version = "1", features = ["full"] }

[dev-dependencies]         # only for tests/examples
mockall = "0.13"

[profile.release]
lto = true                 # link-time optimization
codegen-units = 1          # better optimization, slower build
```

### Daily Workflow Loop

The typical inner loop while coding:

1. `cargo check` — fast feedback while writing
2. `cargo clippy` — catch idiom issues
3. `cargo test` — verify behavior
4. `cargo fmt` — before committing
5. `cargo run --release` — final perf check

### Useful Extras

bash

```bash
cargo install <tool>       # install a binary crate globally
cargo install cargo-watch  # auto-rerun on file changes
cargo watch -x check       # then: re-check on every save
cargo install cargo-edit   # adds cargo add/rm/upgrade (built-in since 1.62 though)
```

### Workspaces (multi-crate projects)

toml

```toml
# Cargo.toml at root
[workspace]
members = ["app", "core", "api"]
resolver = "2"
```

Then `cargo build` at the root builds everything. Useful when your project grows past a single crate — common pattern for the kind of backend services you build (e.g. splitting Go-style into `api/`, `worker/`, `shared/` crates).
