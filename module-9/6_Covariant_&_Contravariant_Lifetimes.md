This is advanced — Rust uses variance to decide when a longer lifetime can substitute for a shorter one.

```rust
// covariant: &'long T can be used where &'short T is expected
fn print_str(s: &'static str) {
    println!("{}", s);
    // output → hello
}

fn main() {
    let s: &'static str = "hello";
    print_str(s);   // ✅ 'static can be used anywhere a shorter lifetime works
}
```

```text
Covariant     → longer lifetime can substitute shorter (most common, like &'a T)
Invariant     → lifetimes must match EXACTLY (like &mut T)
Contravariant → rare in practice (used in fn pointers)
```

```rust
// &T is covariant — this works:
fn takes_short<'a>(_s: &'a str) {}
let long_lived: &'static str = "hello";
takes_short(long_lived);   // ✅ 'static substitutes for 'a

// &mut T is invariant — lifetimes must match exactly
fn invariant_example<'a>(_s: &'a mut &'a str) {}
```

💡 You won't need to manually write variance — the compiler handles it. Just know it exists so error messages make sense later.
