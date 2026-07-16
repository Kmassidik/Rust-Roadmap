#### For single-threaded shared ownership — multiple owners, one value:

```rust
use std::rc::Rc;

let a = Rc::new(String::from("hello"));
let b = Rc::clone(&a);   // clone the pointer, not the data
let c = Rc::clone(&a);

println!("{}", a);                    // output → hello
println!("{}", b);                    // output → hello
println!("owners: {}", Rc::strong_count(&a)); // output → owners: 3

// when all Rc clones drop, value is freed
drop(b);
println!("owners: {}", Rc::strong_count(&a)); // output → owners: 2
```
⚠️ ```Rc``` is NOT thread-safe — use ```Arc``` for multi-threading!

#### Rc with RefCell for interior mutability:

```rust
use std::rc::Rc;
use std::cell::RefCell;

let shared = Rc::new(RefCell::new(vec![1, 2, 3]));
let clone1  = Rc::clone(&shared);
let clone2  = Rc::clone(&shared);

clone1.borrow_mut().push(4);
clone2.borrow_mut().push(5);

println!("{:?}", shared.borrow());
// output → [1, 2, 3, 4, 5]
```
