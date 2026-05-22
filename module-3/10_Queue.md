```rust
use std::collections::VecDeque;

let mut queue: VecDeque<i32> = VecDeque::new();

// enqueue
queue.push_back(1);
queue.push_back(2);
queue.push_back(3);

// dequeue -> First in First Out
println!("{:?}", queue.pop_front());  // some(1)
println!("{:?}", queue.pop_front());  // some(2)

// peek
println!("{:?}", queue.front());  // some(3)
println!("{:?}", queue.back());   // some(3)

// check
queue.is_empty();
queue.len();
```
