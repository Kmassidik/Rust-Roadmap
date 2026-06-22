Threads can't share normal references — need Arc (atomic reference count) + Mutex (mutual exclusion):

```rust
use std::sync::{Arc, Mutex};
use std::thread;

fn main() {
    let counter = Arc::new(Mutex::new(0));
    let mut handles = vec![];

    for _ in 0..5 {
        let counter = Arc::clone(&counter);
        let handle = thread::spawn(move || {
            let mut num = counter.lock().unwrap();
            *num += 1;
        });
        handles.push(handle);
    }

    for handle in handles {
        handle.join().unwrap();
    }

    println!("Result: {}", *counter.lock().unwrap());
    // output → Result: 5
}
```

```
Arc → Atomic Reference Counted, lets multiple threads OWN the same data
Mutex → Mutual Exclusion, only ONE thread can access the data at a time
```
