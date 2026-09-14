#### QUIC protocol implementation — the transport underneath HTTP/3, built on UDP instead of TCP:

What QUIC fixes over TCP:

| TCP Problem | QUIC Fix |
|---|---|
| Head-of-line blocking (one lost packet stalls all streams) | Independent streams — a lost packet only blocks its own stream |
| Slow handshake (TCP + TLS = 2-3 round trips) | 0-RTT / 1-RTT handshake — encryption is built in from the start |
| No built-in encryption | TLS 1.3 is mandatory, not optional |
| Connection tied to IP:port | Connection IDs survive network changes (e.g. wifi → mobile) |

#### Minimal endpoint setup (conceptual — real cert/config setup is more involved):

```rust
use quinn::{Endpoint, ServerConfig};

#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    let server_config = ServerConfig::with_single_cert(cert_chain, priv_key)?;
    let endpoint = Endpoint::server(server_config, "0.0.0.0:4433".parse()?)?;

    while let Some(conn) = endpoint.accept().await {
        let connection = conn.await?;
        let (mut send, mut recv) = connection.accept_bi().await?;
        // read/write over the stream like any async I/O
    }

    Ok(())
}
```

⚠️ This is niche/advanced — you'll reach for `quinn` specifically when building something HTTP/3-native or a custom low-latency protocol (game networking, real-time streaming). For normal web work, `reqwest`/`hyper` (HTTP/1.1 & 2 over TCP) cover the vast majority of cases.
