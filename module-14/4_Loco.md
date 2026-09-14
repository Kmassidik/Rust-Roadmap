#### "Rails for Rust" — convention-over-configuration, built on top of Axum under the hood:

```bash
loco new my_app          # scaffold a new project (picks DB, background jobs, etc. interactively)
cd my_app
cargo loco generate model user name:string email:string
cargo loco generate controller users
cargo loco db migrate
cargo loco start          # run the dev server
```

- Generators write the boilerplate for you — models (with a migration), controllers, mailers, background jobs — same philosophy as `rails generate`.
- Comes with an ORM (SeaORM) and migrations wired up by default, unlike bare Axum where you pick and wire `sqlx`/`diesel` yourself.

#### A generated controller looks like plain Axum underneath:

```rust
pub fn routes() -> Routes {
    Routes::new()
        .prefix("users")
        .add("/", get(list))
        .add("/:id", get(get_one))
}

async fn list(State(ctx): State<AppContext>) -> Result<Json<Vec<users::Model>>> {
    let users = users::Entity::find().all(&ctx.db).await?;
    format::json(users)
}
```

⚠️ Newer and smaller ecosystem than Axum/Actix (mainstream since ~2024) — fewer StackOverflow answers, fewer third-party examples.

✅ Pick Loco when you want a batteries-included setup fast (CRUD app, admin-style backend); pick bare Axum when you want full control over every dependency and don't want an opinionated project structure imposed on you.
