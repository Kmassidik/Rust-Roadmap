#### Async, compile-time checked *raw SQL* — not an ORM, no schema DSL, you write real SQL:

```rust
use sqlx::sqlite::SqlitePool;

#[tokio::main]
async fn main() -> Result<(), sqlx::Error> {
    let pool = SqlitePool::connect("sqlite:app.db").await?;

    let row: (i64, String) = sqlx::query_as("SELECT id, name FROM users WHERE id = ?")
        .bind(1)
        .fetch_one(&pool)
        .await?;

    println!("{}: {}", row.0, row.1);
    Ok(())
}
```

#### The `query!` macro checks your SQL against a *real* database at compile time (needs `DATABASE_URL` set, or `cargo sqlx prepare` for offline/CI builds):

```rust
let user = sqlx::query!("SELECT id, name FROM users WHERE id = ?", 1)
    .fetch_one(&pool)
    .await?;

println!("{}: {}", user.id, user.name);   // fields are typed, not stringly-typed
```

```bash
sqlx migrate add create_users     # generate a migration file
sqlx migrate run                  # apply migrations
cargo sqlx prepare                # cache query metadata for offline compile-time checks (CI)
```

✅ Native async, drops straight into a Tokio/Axum stack with no `spawn_blocking` gymnastics — this is the default reach-for-it choice for async web backends by 2026.
⚠️ Compile-time checking needs a live DB connection (or a checked-in `.sqlx` cache) during `cargo build` — more CI setup than Diesel or rusqlite.
