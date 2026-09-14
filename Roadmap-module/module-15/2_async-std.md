Designed to mirror `std`'s API 1:1, just async — the pitch was "if you know std, you know async-std".

```rust
use async_std::task;

fn main() {
    task::block_on(async {
        println!("hello from async-std");
    });
}
```

#### std-mimicking file I/O:

```rust
use async_std::fs;

async fn read_it() -> std::io::Result<String> {
    fs::read_to_string("Cargo.toml").await
}
```

#### Spawning:

```rust
use async_std::task;

task::spawn(async {
    println!("background task");
});
```

⚠️ By 2026, Tokio has won the ecosystem — most crates (Axum, reqwest, sqlx) target Tokio, and async-std's own maintenance has slowed. Worth knowing the API for legacy codebases, but don't start a new project on it.

✅ Still reasonable for small, dependency-light projects that don't touch the Tokio-centric web/networking ecosystem at all.
