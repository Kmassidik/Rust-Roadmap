#### Like HashMap but always sorted by key:

```rust
use std::collections::BTreeMap;

let mut map = BTreeMap::new();

map.insert("banana", 3);
map.insert("apple",  5);
map.insert("cherry", 1);

for (key, val) in &map {
    println!("{}: {}", key, val);
    // output → apple: 5, banana: 3, cherry: 1 (sorted!)
}

// range queries (unique to BTreeMap!)
for (key, val) in map.range("apple"..="banana") {
    println!("{}: {}", key, val);
    // output → apple: 5, banana: 3
}

// first and last
println!("{:?}", map.iter().next());       // output → Some(("apple", 5))
println!("{:?}", map.iter().next_back());  // output → Some(("cherry", 1))
```

#### BTreeMap vs HashMap:

```text
HashMap   → unordered, faster O(1)   → use when order doesn't matter
BTreeMap  → sorted, slower O(log n)  → use when you need sorted keys or range queries
```
