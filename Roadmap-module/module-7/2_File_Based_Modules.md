Split code across files:

```
src/
├── main.rs
├── math.rs        ← mod math
└── greet.rs       ← mod greet
```

main.rs:

```rust
mod math;    // tells Rust to look for math.rs
mod greet;

fn main() {
    println!("{}", math::add(2, 3));    // 5
    greet::hello();                     // Hello!
}
```

math.rs:

```rust
pub fn add(a: i32, b: i32) -> i32 {
    a + b
}
```

greet.rs:

```rust
pub fn hello() {
    println!("Hello!");
}
```

Nested file modules:

```rust
src/
├── main.rs
└── math/
    ├── mod.rs     ← declares math module
    └── advanced.rs
```

math/mod.rs:

```rust
pub mod advanced;   // declares submodule

pub fn add(a: i32, b: i32) -> i32 {
    a + b
}
```

math/advanced.rs:

```rust
pub fn power(base: i32, exp: u32) -> i32 {
    base.pow(exp)
}
```
