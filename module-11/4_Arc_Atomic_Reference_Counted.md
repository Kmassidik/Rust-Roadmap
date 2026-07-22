#### Like Rc but thread-safe:

```rust
use std::sync::Arc;
use std::thread;

let data = Arc::new(vec![1, 2, 3]);
let mut handles = vec![];

for _ in 0..3 {
    let data = Arc::clone(&data);
    let handle = thread::spawn(move || {
        println!("{:?}", data);
        // output → [1, 2, 3] (from each thread)
    });
    handles.push(handle);
}

for handle in handles {
    handle.join().unwrap();
}
```

```text
Rc<T>         → single thread, multiple owners, faster
Arc<T>        → multi thread, multiple owners, thread-safe
Arc + Mutex   → multi thread, multiple owners + mutation
```

