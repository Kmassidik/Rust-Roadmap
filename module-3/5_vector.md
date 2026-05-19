```rust
// create
let mut v: Vec<i32> = Vec::new();
let mut v = vec![1, 2, 3];

// add / remove
v.push(4);          // add to end
v.pop();            // remove from end
v.insert(1, 10);    // insert at index
v.remove(0);        // remove at index

// access
println!("{}", v[0]);        // direct access (panics if out of bounds)
println!("{:?}", v.get(0));  // safe -> returns Option<&i32>

// iterate
for item in &v {
    println!("{}", item);
}

// useful methods
println!("{}", v.len());
println!("{}", v.is_empty());
println!("{}", v.contains(&3));

v.sort();
v.reverse();
v.dedup(); // remove consecutive duplicates
```
