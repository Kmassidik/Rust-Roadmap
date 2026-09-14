The dominant async runtime in Rust — if a crate says "async", it almost certainly means Tokio underneath. Axum, most of the web/networking ecosystem, and this whole roadmap's later modules assume it.

```rust
#[tokio::main]
async fn main() {
    println!("hello from the runtime");
}
```

#### Spawning tasks — runs concurrently on the runtime's thread pool:

```rust
use tokio::time::{sleep, Duration};

#[tokio::main]
async fn main() {
    let handle = tokio::spawn(async {
        sleep(Duration::from_millis(100)).await;
        println!("task done");
    });

    handle.await.unwrap();
}
```

#### `select!` — race multiple futures, run whichever finishes first:

```rust
use tokio::time::{sleep, Duration};

#[tokio::main]
async fn main() {
    tokio::select! {
        _ = sleep(Duration::from_secs(1)) => println!("slow branch"),
        _ = sleep(Duration::from_millis(100)) => println!("fast branch wins"),
    }
}
```

#### Runtime flavors:

```toml
tokio = { version = "1", features = ["full"] }
```

- `#[tokio::main]` → multi-threaded runtime by default (work-stealing thread pool)
- `#[tokio::main(flavor = "current_thread")]` → single-threaded, lighter weight, good for CLI tools/tests

⚠️ Never block inside an async fn (`std::thread::sleep`, heavy CPU loops) — it stalls the whole worker thread. Use `tokio::task::spawn_blocking` for blocking work instead. ✅
