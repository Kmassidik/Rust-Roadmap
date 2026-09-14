#### The `json` crate — dynamic, untyped JSON without defining a struct:

```rust
use json::object;

fn main() {
    let data = object! {
        name: "Kurnia",
        age: 30,
        active: true,
        tags: ["rust", "learning"]
    };

    println!("{}", data.dump());          // output → {"name":"Kurnia","age":30,"active":true,"tags":["rust","learning"]}
    println!("{}", data["name"]);         // output → Kurnia
    println!("{}", data["age"].as_u32().unwrap()); // output → 30
}
```

```bash
cargo add json
```

#### Parsing arbitrary JSON without a struct:

```rust
let parsed = json::parse(r#"{"a": 1, "b": [2, 3]}"#).unwrap();
println!("{}", parsed["b"][1]);   // output → 3
```

⚠️ This is the older, much less common choice today — almost everyone reaches for `serde_json` instead (see `1_Serde.md`) because it's typed, faster, and has the whole `serde` ecosystem behind it.

✅ Still useful when you genuinely don't want to define a struct — quick scripts, exploring an unknown JSON shape, one-off tools.
