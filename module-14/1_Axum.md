#### Tokio-based, built on `tower`/`tower-http` middleware — the most widely adopted Rust web framework as of 2026:

```rust
use axum::{Router, routing::get, extract::State, Json};
use serde::{Deserialize, Serialize};
use std::sync::Arc;

#[derive(Clone)]
struct AppState {
    counter: Arc<std::sync::atomic::AtomicI64>,
}

async fn handler() -> &'static str {
    "Hello, Axum!"
}

#[tokio::main]
async fn main() {
    let state = AppState { counter: Arc::new(0.into()) };

    let app = Router::new()
        .route("/", get(handler))
        .route("/count", get(get_count))
        .with_state(state);

    let listener = tokio::net::TcpListener::bind("0.0.0.0:3000").await.unwrap();
    axum::serve(listener, app).await.unwrap();
}

async fn get_count(State(state): State<AppState>) -> String {
    state.counter.load(std::sync::atomic::Ordering::Relaxed).to_string()
}
```

⚠️ Async-only — requires an executor. Almost always paired with `#[tokio::main]`.

#### JSON in/out with `Json<T>`:

```rust
#[derive(Deserialize)]
struct CreateUser { name: String }

#[derive(Serialize)]
struct User { id: u64, name: String }

async fn create_user(Json(payload): Json<CreateUser>) -> Json<User> {
    Json(User { id: 1, name: payload.name })
}
```

✅ Because it's built directly on `tower`, you get the entire `tower`/`tower-http` middleware ecosystem for free (rate limiting, tracing, CORS, compression, retries) — this is Axum's biggest advantage over Actix/Rocket.
