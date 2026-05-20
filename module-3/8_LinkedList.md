```rust
use std::collections::LinkedList;

let mut list: LinkedList<i32> = LinkedList::new();

// add
list.push_back(1);    // add to end
list.push_back(2);
list.push_front(0);   // add to front

// remove
list.pop_back();      // remove from end
list.pop_front();     // remove from front

// length
list.len();

println!("{:?}", list);
```
