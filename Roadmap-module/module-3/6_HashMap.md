```rust
use std::collections::HashMap;

let mut map: HashMap<&str, u32> = HashMap::new();

// insert
map.insert("Alice", 90);
map.insert("Bob", 85);

// access
println!("{:?}", map.get("Alice"));          // Some(90)

// check existence
map.contains_key("Alice");                   // true

// update
map.insert("Alice", 95);                     // overwrites
map.entry("Charlie").or_insert(80);          // insert if not exists

// iterate
for (key, value) in &map {
    println!("{}: {}", key, value);
}

// remove
map.remove("Bob");

// length
map.len();
```
