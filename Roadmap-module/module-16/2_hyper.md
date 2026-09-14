#### The low-level HTTP library everything else is built on — `reqwest` and `Axum` both sit on top of `hyper`:

```rust
use hyper::server::conn::http1;
use hyper::service::service_fn;
use hyper::{Request, Response, body::Bytes};
use http_body_util::Full;
use tokio::net::TcpListener;
use hyper_util::rt::TokioIo;

async fn handle(_req: Request<hyper::body::Incoming>) -> Result<Response<Full<Bytes>>, hyper::Error> {
    Ok(Response::new(Full::new(Bytes::from("Hello from hyper!"))))
}

#[tokio::main]
async fn main() {
    let listener = TcpListener::bind("127.0.0.1:3000").await.unwrap();

    loop {
        let (stream, _) = listener.accept().await.unwrap();
        let io = TokioIo::new(stream);

        tokio::spawn(async move {
            if let Err(err) = http1::Builder::new()
                .serve_connection(io, service_fn(handle))
                .await
            {
                println!("connection error: {:?}", err);
            }
        });
    }
}
```

⚠️ You rarely write this much boilerplate by hand — this is what `Axum` wraps for you as a web framework, and what `reqwest` wraps for you as a client. Reach for `hyper` directly only when you're building your own framework/library or need connection-level control.
