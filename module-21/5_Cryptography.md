#### ring — widely used, audited, high-performance primitives:

```rust
use ring::digest::{Context, SHA256};

let mut ctx = Context::new(&SHA256);
ctx.update(b"hello world");
let digest = ctx.finish();
```

✅ What a lot of production TLS/crypto code actually relies on underneath (e.g. `rustls` uses it). Good default when you need solid, fast, battle-tested primitives without picking ten separate crates.

---

#### sodiumoxide — libsodium bindings:

⚠️ **Archived / unmaintained** — was the go-to libsodium wrapper for years, but the repo has had no meaningful activity for a long time. Don't start new projects on it.

If you want libsodium-style high-level, hard-to-misuse APIs today, look at **`orion`** (pure Rust, no C dependency) or **`dryoc`** instead.

---

#### rust-crypto ("RustCrypto") — pure-Rust primitives, no C deps:

⚠️ Not one monolithic crate — "RustCrypto" is an *organization* publishing many small, focused crates: `sha2`, `aes`, `hmac`, `rsa`, `ed25519-dalek`, etc. You pick exactly the primitives you need.

```rust
use sha2::{Sha256, Digest};

let mut hasher = Sha256::new();
hasher.update(b"hello world");
let result = hasher.finalize();
```

✅ The common current choice when you want pure-Rust primitives and don't want to link against OpenSSL/libsodium at all.
