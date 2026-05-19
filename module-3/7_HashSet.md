```rust
    use std::collections::HashSet;
    
    let mut set: HashSet<i32> = HashSet::new();
    
    set.insert(1);
    set.insert(2);
    set.insert(3);
    set.insert(4);
    set.insert(4); // ignored! already exists
    
    // check 
    set.contains(&1); // true
    
    // remove
    set.remove(&1);
    
    // set operations
    let a: HashSet<i32> = [1, 2, 3].iter().cloned().collect();
    let b: HashSet<i32> = [2, 3, 4].iter().cloned().collect();
    
    let union: Vec<_> = a.union(&b).collect();                // [1,2,3,4]
    let intersection: Vec<_> = a.intersection(&b).collect();  // [2,3]
    let difference: Vec<_> = a.difference(&b).collect();      // [1]
```
