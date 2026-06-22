Send data between threads safely:

```rust
use std::sync::mpsc;   // multiple producer, single consumer
use std::thread;

fn main() {
    let (tx, rx) = mpsc::channel();

    thread::spawn(move || {
        let messages = vec!["hello", "from", "thread"];
        for msg in messages {
            tx.send(msg).unwrap();
        }
    });

    for received in rx {
        println!("Got: {}", received);
        // output → Got: hello, Got: from, Got: thread
    }
}
```
