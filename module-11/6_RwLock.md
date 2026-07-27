#### Like Mutex but allows multiple readers OR one writer:

In Rust, RwLock (Read-Write Lock) is a synchronization primitive that allows:

```rust
use std::sync::{Arc, RwLock};
use std::thread;

let data = Arc::new(RwLock::new(vec![1, 2, 3]));
let mut handles = vec![];

// multiple readers at once ✅
for i in 0..3 {
    let data = Arc::clone(&data);
    let handle = thread::spawn(move || {
        let r = data.read().unwrap();
        println!("Reader {}: {:?}", i, *r);
        // output → Reader 0: [1, 2, 3] (all 3 readers run at once!)
    });
    handles.push(handle);
}

for handle in handles {
    handle.join().unwrap();
}

// one writer ✅
{
    let mut w = data.write().unwrap();
    w.push(4);
}

println!("{:?}", *data.read().unwrap());
// output → [1, 2, 3, 4]
```

```
Mutex   → one thread at a time (read OR write)
RwLock  → many readers at once OR one writer
```
