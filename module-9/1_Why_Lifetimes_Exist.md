Lifetimes prevent dangling references — using a reference after the data it points to is gone:

```rust
fn main() {
    let r;
    {
        let x = 5;
        r = &x;   // ❌ error! x doesn't live long enough
    }
    println!("{}", r);   // x is already dropped here
}
```

Rust's borrow checker catches this at compile time — no runtime crash like in C! ✅
