Async lets you run many tasks concurrently without OS threads — great for I/O (network, file, etc).

Add tokio (async runtime):

```bash
cargo add tokio --features full
```

```rust
use tokio::time::{sleep, Duration};

async fn say_hello() {
    println!("Hello");
    // output → Hello
    sleep(Duration::from_millis(100)).await;
    println!("World");
    // output → World
}

#[tokio::main]
async fn main() {
    say_hello().await;
}
```

Running multiple async tasks concurrently:

```rust
use tokio::time::{sleep, Duration};

async fn task(name: &str, delay: u64) {
    sleep(Duration::from_millis(delay)).await;
    println!("{} done", name);
}

#[tokio::main]
async fn main() {
    let t1 = task("Task A", 200);
    let t2 = task("Task B", 100);
    let t3 = task("Task C", 50);

    tokio::join!(t1, t2, t3);
    /* output (runs concurrently, fastest finishes first) →
    Task C done
    Task B done
    Task A done
    */
}
```

spawn for background tasks:

```rust
#[tokio::main]
async fn main() {
    let handle = tokio::spawn(async {
        println!("running in background");
        // output → running in background
        42
    });

    let result = handle.await.unwrap();
    println!("got: {}", result);
    // output → got: 42
}
```

---

```noted
thread::spawn   → create OS thread, runs in parallel
.join()         → wait for thread to finish
mpsc::channel   → send messages between threads safely
Arc<T>          → share ownership across threads
Mutex<T>        → only one thread accesses data at a time
Atomic types    → lock-free thread-safe counters
async/await     → concurrency without OS threads, great for I/O
tokio::spawn    → run async task in background
tokio::join!    → run multiple async tasks concurrently
```
