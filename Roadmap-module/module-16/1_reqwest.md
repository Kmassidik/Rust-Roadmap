#### High-level async HTTP client — built on top of `hyper`:

```rust
use reqwest;

#[tokio::main]
async fn main() -> Result<(), reqwest::Error> {
    let res = reqwest::get("https://api.github.com/users/rust-lang")
        .await?
        .text()
        .await?;

    println!("{}", res);
    Ok(())
}
```

#### Deserialize JSON straight into a struct with `.json::<T>()`:

```rust
use serde::Deserialize;

#[derive(Deserialize, Debug)]
struct User {
    login: String,
    id: u64,
}

#[tokio::main]
async fn main() -> Result<(), reqwest::Error> {
    let user: User = reqwest::get("https://api.github.com/users/rust-lang")
        .await?
        .json()
        .await?;

    println!("{:?}", user);
    Ok(())
}
```

#### POST with JSON body, using a reusable `Client`:

```rust
let client = reqwest::Client::new();
let res = client
    .post("https://httpbin.org/post")
    .json(&serde_json::json!({ "key": "value" }))
    .send()
    .await?;
```

✅ Use `reqwest` for almost everything — it's the standard choice for making HTTP requests as a client. Reach for `hyper` directly only when you need low-level control.
