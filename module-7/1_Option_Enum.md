Used when a value might or might not exist — replaces null:

```rust
// definition (built into Rust)
enum Option<T> {
    Some(T),   // has a value
    None,      // no value
}

// example
let name: Option<&str> = Some("Alice");
let empty: Option<&str> = None;

// access with match
match name {
    Some(n) => println!("Name: {}", n),
    None    => println!("No name"),
}

// access with if let
if let Some(n) = name {
    println!("Name: {}", n);
}

// unwrap (dangerous! panics if None)
let n = name.unwrap();

// unwrap_or (safe, provides default)
let n = name.unwrap_or("Unknown");

// unwrap_or_else (safe, runs closure)
let n = name.unwrap_or_else(|| "Unknown");

// is_some / is_none
name.is_some();   // true
name.is_none();   // false

// map (transform value inside Option)
let length = name.map(|n| n.len());   // Some(5)
```
