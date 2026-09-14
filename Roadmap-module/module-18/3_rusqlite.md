#### Direct, synchronous SQLite bindings — simplest of the three, no async runtime, no ORM layer:

```rust
use rusqlite::{Connection, Result};

fn main() -> Result<()> {
    let conn = Connection::open("app.db")?;

    conn.execute(
        "CREATE TABLE IF NOT EXISTS users (id INTEGER PRIMARY KEY, name TEXT NOT NULL)",
        (),
    )?;

    conn.execute("INSERT INTO users (name) VALUES (?1)", ["Kurnia"])?;

    let mut stmt = conn.prepare("SELECT id, name FROM users")?;
    let rows = stmt.query_map((), |row| {
        Ok((row.get::<_, i32>(0)?, row.get::<_, String>(1)?))
    })?;

    for row in rows {
        let (id, name) = row?;
        println!("{}: {}", id, name);
    }

    Ok(())
}
```

✅ Best fit for CLI tools and desktop apps that just need a local embedded DB — no server, no async, no migrations tooling. `app.db` is a single file, ship it alongside the binary.
⚠️ SQLite only — no Postgres/MySQL support, and it's blocking, so don't call it directly inside an async handler (use `spawn_blocking` if you must mix it into a Tokio app).
