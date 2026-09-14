A minimal, composable async runtime — small codebase, few dependencies, built from independent crates (`async-io`, `async-task`, `async-executor`) you can mix and match instead of one monolithic runtime.

```rust
fn main() {
    smol::block_on(async {
        println!("hello from smol");
    });
}
```

#### Spawning:

```rust
use smol::Timer;
use std::time::Duration;

fn main() {
    smol::block_on(async {
        let task = smol::spawn(async {
            Timer::after(Duration::from_millis(100)).await;
            "done"
        });

        println!("{}", task.await);
    });
}
```

#### When to reach for it over Tokio:

- Minimal dependency footprint matters (embedded-adjacent, small CLI tools)
- You want to compose your own executor from pieces rather than take Tokio's full feature set
- Fast compile times matter more than ecosystem breadth

⚠️ Much smaller ecosystem than Tokio — most async crates (Axum, tonic, sqlx) assume Tokio and won't run on smol without a compat shim. Pick Tokio by default; reach for smol only when you specifically want "less runtime, more control."
