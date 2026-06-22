Create OS threads with std::thread:

```rust
use std::thread;
use std::time::Duration;

fn main(){
    let handle = thread::spawn(|| {
        for i in 1..5 {
            println!("thread: {}", i);
            // output -> thread: 1, thread: 2, ... thread: 4
            thread::sleep(Duration::from_millis(1));
        }
    });

    for i in 1..3 {
        println!("main: {}", i);
        // output → main: 1, main: 2
    }

    handle.join().unwrap();   // wait for thread to finish
}
```

⚠️ Without .join(), the program might exit before the thread finishes!

Moving data into threads:

```rust
use std::thread;

fn main() {
    let data = vec![1, 2, 3];

    let handle = thread::spawn(move || {
        println!("{:?}", data);   // output → [1, 2, 3]
    });

    handle.join().unwrap();
    // println!("{:?}", data);   // ❌ error! data was moved
}
```
