#### The `toml` crate — parse/write TOML, the format `Cargo.toml` itself uses:

```rust
use serde::{Serialize, Deserialize};

#[derive(Serialize, Deserialize, Debug)]
struct Config {
    name: String,
    version: String,
    debug: bool,
}

fn main() {
    let toml_str = r#"
        name = "my_app"
        version = "0.1.0"
        debug = true
    "#;

    let config: Config = toml::from_str(toml_str).unwrap();
    println!("{:?}", config);   // output → Config { name: "my_app", version: "0.1.0", debug: true }

    let back = toml::to_string(&config).unwrap();
    println!("{}", back);
    // output →
    // name = "my_app"
    // version = "0.1.0"
    // debug = true
}
```

```bash
cargo add toml
cargo add serde --features derive
```

⚠️ `toml` doesn't do the (de)serialization itself — same as `serde_json`, it plugs into `serde`'s derived `Serialize`/`Deserialize` traits.

✅ This is exactly what powers `Cargo.toml` parsing in `cargo` and `rustc` tooling — good crate to know well since every Rust project depends on it, directly or not.
