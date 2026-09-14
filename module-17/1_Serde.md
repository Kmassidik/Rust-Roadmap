#### The de facto standard for (de)serialization — derive it once, use it with any format:

```rust
use serde::{Serialize, Deserialize};

#[derive(Serialize, Deserialize, Debug)]
struct User {
    name: String,
    age: u32,
}

fn main() {
    let user = User { name: "Kurnia".to_string(), age: 30 };

    // struct → JSON string
    let json = serde_json::to_string(&user).unwrap();
    println!("{}", json);              // output → {"name":"Kurnia","age":30}

    // JSON string → struct
    let back: User = serde_json::from_str(&json).unwrap();
    println!("{:?}", back);            // output → User { name: "Kurnia", age: 30 }
}
```

```bash
cargo add serde --features derive
cargo add serde_json
```

⚠️ `serde` itself is format-agnostic — it just defines the `Serialize`/`Deserialize` traits. The actual format lives in a separate crate:

| Format | Crate |
|---|---|
| JSON | `serde_json` |
| YAML | `serde_yaml` |
| TOML | `toml` (see `3_toml-rust.md`) |
| MessagePack | `rmp-serde` |

✅ Same derived struct works with all of them — write once, (de)serialize anywhere.
