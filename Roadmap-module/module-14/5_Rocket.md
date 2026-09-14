#### Ergonomic, macro-heavy routing — routes read almost like decorators:

```rust
#[macro_use] extern crate rocket;

#[get("/")]
fn index() -> &'static str {
    "Hello, Rocket!"
}

#[get("/greet/<name>")]
fn greet(name: &str) -> String {
    format!("Hello, {name}!")
}

#[launch]
fn rocket() -> _ {
    rocket::build().mount("/", routes![index, greet])
}
```

- `#[get("/path")]` attaches directly to the handler function — no separate `.route()` call needed like Axum/Actix.
- `#[launch]` replaces `fn main()` and wires up the async runtime for you.

#### JSON via a request guard:

```rust
#[derive(serde::Deserialize)]
struct CreateUser { name: String }

#[post("/users", data = "<user>")]
fn create_user(user: rocket::serde::json::Json<CreateUser>) -> String {
    format!("created {}", user.name)
}
```

⚠️ For a long stretch of its history (pre-2021ish) Rocket required nightly Rust for its macro magic — that's no longer true, it's been stable-Rust-compatible for years now, but you'll still see old blog posts/tutorials warning about nightly that are outdated.

✅ The tradeoff for that clean macro syntax is a smaller middleware ecosystem than Axum's `tower` integration — fine for smaller apps, more friction if you need a lot of off-the-shelf middleware.
