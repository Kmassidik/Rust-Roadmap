Cargo.toml is your project config:

```rust
[package]
name    = "my_project"
version = "0.1.0"
edition = "2021"

[dependencies]
serde       = { version = "1.0", features = ["derive"] }
reqwest     = "0.11"
tokio       = { version = "1", features = ["full"] }
rand        = "0.8"
```

Add dependency via CLI:

```rust
cargo add rand          # add latest version
cargo add rand@0.8      # add specific version
cargo remove rand       # remove dependency
cargo update            # update all dependencies
```

Use in code:

```rust
use rand::Rng;

fn main() {
    let mut rng = rand::thread_rng();
    let n: u32 = rng.gen_range(1..=100);
    println!("random: {}", n);   // random: 42 (random each time)
}
```

Cargo commands:

```rust
cargo build           # compile
cargo run             # compile + run
cargo test            # run tests
cargo doc --open      # generate + open docs
cargo check           # check errors without compiling
cargo clean           # remove target folder
cargo tree            # show dependency tree
```
