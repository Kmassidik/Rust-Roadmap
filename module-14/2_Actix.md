#### `actix-web` — one of the oldest and fastest Rust web frameworks, built on top of the Actix actor framework (though most web code today doesn't touch actors directly):

```rust
use actix_web::{web, App, HttpServer, HttpResponse, Responder};

async fn handler() -> impl Responder {
    HttpResponse::Ok().body("Hello, Actix!")
}

async fn greet(path: web::Path<String>) -> impl Responder {
    let name = path.into_inner();
    HttpResponse::Ok().body(format!("Hello, {name}!"))
}

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    HttpServer::new(|| {
        App::new()
            .route("/", web::get().to(handler))
            .route("/greet/{name}", web::get().to(greet))
    })
    .bind(("0.0.0.0", 8080))?
    .run()
    .await
}
```

⚠️ Async-only, has its own runtime built on Tokio internally (`#[actix_web::main]` sets it up — no separate `#[tokio::main]` needed).

#### Extractors — pull data straight out of the request:

```rust
use actix_web::{web, HttpResponse};
use serde::Deserialize;

#[derive(Deserialize)]
struct CreateUser { name: String }

async fn create_user(payload: web::Json<CreateUser>) -> HttpResponse {
    HttpResponse::Ok().json(format!("created {}", payload.name))
}
```

✅ Historically the fastest in TechEmpower benchmarks; heritage from the actor model means it has native support for actor-based background tasks (`actix::Actor`) if you need them — Axum has no equivalent built in.
