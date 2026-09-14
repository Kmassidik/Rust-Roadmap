```rust
let mut stack: Vec<i32> = Vec::new();

// push
stack.push(1);
stack.push(2);
stack.push(3);

// pop → Last In First Out
println!("{:?}", stack.pop());    // Some(3)
println!("{:?}", stack.pop());    // Some(2)

// peek (look without removing)
println!("{:?}", stack.last());   // Some(1)

// check
stack.is_empty();
stack.len();
```
