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
