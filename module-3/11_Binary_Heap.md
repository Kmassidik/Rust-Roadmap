```rust
use std::collections::BinaryHeap;

let mut heap: BinaryHeap<i32> = BinaryHeap::new();

heap.push(5);
heap.push(1);
heap.push(10);
heap.push(3);

println!("{:?}", heap.pop());   // Some(10) ← always max!
println!("{:?}", heap.pop());   // Some(5)
println!("{:?}", heap.pop());   // Some(3)
println!("{:?}", heap.pop());   // Some(1)

// peek without removing
println!("{:?}", heap.peek());  // largest value

// check
heap.is_empty();
heap.len();
```
