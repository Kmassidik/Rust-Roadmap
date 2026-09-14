#### Like HashSet but always sorted:

```rust
use std::collections::BTreeSet;

let mut set = BTreeSet::new();

set.insert(5);
set.insert(1);
set.insert(3);
set.insert(1);   // ignored, already exists

for val in &set {
    println!("{}", val);
    // output → 1, 3, 5 (sorted, no duplicates)
}

// range
for val in set.range(1..=3) {
    println!("{}", val);
    // output → 1, 3
}

// set operations
let a: BTreeSet<i32> = [1, 2, 3].iter().cloned().collect();
let b: BTreeSet<i32> = [2, 3, 4].iter().cloned().collect();

let union:        Vec<_> = a.union(&b).collect();        // [1,2,3,4]
let intersection: Vec<_> = a.intersection(&b).collect(); // [2,3]
let difference:   Vec<_> = a.difference(&b).collect();   // [1]

println!("{:?}", union);        // output → [1, 2, 3, 4]
println!("{:?}", intersection); // output → [2, 3]
println!("{:?}", difference);   // output → [1]
```
