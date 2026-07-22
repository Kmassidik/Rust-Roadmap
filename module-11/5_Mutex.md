#### Only one thread can access data at a time:

```rust
use std::sync::{Arc, Mutex};
use std::thread;

let data = Arc::new(Mutex::new(vec![]));
let mut handles = vec![];

for i in 0..5 {
    let data = Arc::clone(&data);
    let handle = thread::spawn(move || {
        let mut d = data.lock().unwrap();
        d.push(i);
    });
    handles.push(handle);
}

for handle in handles {
    handle.join().unwrap();
}

let mut result = data.lock().unwrap().clone();
result.sort();
println!("{:?}", result);
// output → [0, 1, 2, 3, 4]
```

#### Deadlock warning:

```rust
// ❌ DEADLOCK — locking same Mutex twice!
let m = Mutex::new(0);
let _a = m.lock().unwrap();
let _b = m.lock().unwrap();   // waits forever!
```
