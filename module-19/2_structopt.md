#### ⚠️ Deprecated — do not use for new projects.

`structopt` was the original derive-macro wrapper around `clap` (`#[derive(StructOpt)]`), back when `clap` itself only had a builder API:

```rust
// old structopt style — for reference only, don't write new code like this
use structopt::StructOpt;

#[derive(StructOpt)]
struct Args {
    name: String,
}
```

Once `clap` v3 shipped its own derive feature (`#[derive(Parser)]`), it absorbed everything `structopt` did. The `structopt` crate is now archived and receives no updates.

❌ Don't add `structopt` as a dependency in new code.
✅ Use `clap` with the `derive` feature instead — see `1_clap.md`, it's the exact same ergonomics.
