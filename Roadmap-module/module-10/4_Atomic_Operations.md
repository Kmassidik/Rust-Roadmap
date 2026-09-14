For simple counters, atomics are faster than Mutex — no locking needed:

```rust
use std::sync::atomic::{AtomicI32, Ordering};
use std::sync::Arc;
use std::thread;

fn main() {
    let counter = Arc::new(AtomicI32::new(0));
    let mut handles = vec![];

    for _ in 0..5 {
        let counter = Arc::clone(&counter);
        let handle = thread::spawn(move || {
            counter.fetch_add(1, Ordering::SeqCst);
        });
        handles.push(handle);
    }

    for handle in handles {
        handle.join().unwrap();
    }

    println!("Result: {}", counter.load(Ordering::SeqCst));
    // output → Result: 5
}
```

Memory Ordering (briefly):

```txt
Ordering::SeqCst    → strictest, safest, easiest to reason about (default choice)
Ordering::Relaxed   → fastest, no ordering guarantees (use only if you know what you're doing)
Ordering::Acquire   → for reads, prevents reordering after
Ordering::Release   → for writes, prevents reordering before
```

💡 Just use SeqCst unless you have a specific performance reason not to.
