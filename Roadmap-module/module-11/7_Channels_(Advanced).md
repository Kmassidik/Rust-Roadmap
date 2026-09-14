#### Already covered in Module 10 — deeper look:

```rust
use std::sync::mpsc;
use std::thread;

// sync channel — blocks sender if buffer is full
let (tx, rx) = mpsc::sync_channel(2);   // buffer size 2

thread::spawn(move || {
    tx.send(1).unwrap();   // ok, buffer has space
    tx.send(2).unwrap();   // ok, buffer has space
    tx.send(3).unwrap();   // blocks until receiver reads!
});

println!("{}", rx.recv().unwrap());   // output → 1
println!("{}", rx.recv().unwrap());   // output → 2
println!("{}", rx.recv().unwrap());   // output → 3

// try_recv — non-blocking
match rx.try_recv() {
    Ok(val)  => println!("got {}", val),
    Err(e)   => println!("nothing yet: {}", e),
    // output → nothing yet: receiving on an empty channel
}
```

---

#### Quick Summary

```text
BTreeMap   → sorted HashMap, range queries
BTreeSet   → sorted HashSet, range queries
Rc<T>      → single-thread shared ownership
Arc<T>     → multi-thread shared ownership
Mutex<T>   → one thread accesses at a time
RwLock<T>  → many readers OR one writer
Channel    → message passing between threads
```

