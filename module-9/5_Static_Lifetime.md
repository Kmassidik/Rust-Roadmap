static means the reference lives for the entire program:

```rust
let s: &'static str = "I live forever";   // string literals are 'static

fn get_static() -> &'static str {
    "this never gets dropped"
}

println!("{}", get_static());
// output → this never gets dropped
```
