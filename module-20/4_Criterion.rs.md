#### The standard benchmarking crate — stable Rust doesn't have built-in `#[bench]` (that's nightly-only), so Criterion is the go-to:

```bash
cargo add --dev criterion --features html_reports
```

#### `benches/my_benchmark.rs`:

```rust
use criterion::{criterion_group, criterion_main, Criterion, black_box};

fn fibonacci(n: u64) -> u64 {
    match n {
        0 => 1,
        1 => 1,
        n => fibonacci(n - 1) + fibonacci(n - 2),
    }
}

fn bench_fib(c: &mut Criterion) {
    c.bench_function("fib 20", |b| b.iter(|| fibonacci(black_box(20))));
}

criterion_group!(benches, bench_fib);
criterion_main!(benches);
```

`black_box` stops the compiler from optimizing away the computation just because the result is unused.

#### Cargo.toml wiring:

```toml
[[bench]]
name = "my_benchmark"
harness = false   # let Criterion run its own harness instead of the default one
```

#### Run it:

```bash
cargo bench
```

⚠️ Unlike a plain `println!` timing hack, Criterion runs many iterations and gives you statistical analysis (mean, std-dev, outliers) plus an HTML report at `target/criterion/report/index.html` — much harder to fool yourself with noise.
