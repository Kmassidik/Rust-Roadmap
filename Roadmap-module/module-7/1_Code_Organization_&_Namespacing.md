Rust organizes code with ```mod```:

```rust
// inline module
mod math {
    pub fn add(a: i32, b: i32) -> i32 {
        a + b
    }

    pub fn subtract(a: i32, b: i32) -> i32 {
        a - b
    }

    // nested module
    pub mod advanced {
        pub fn power(base: i32, exp: u32) -> i32 {
            base.pow(exp)
        }
    }
}

fn main() {
    println!("{}", math::add(2, 3));                // 5
    println!("{}", math::subtract(10, 3));          // 7
    println!("{}", math::advanced::power(2, 10));   // 1024
}
```

use keyword — bring into scope:

```rust
use math::add;
use math::advanced::power;

fn main() {
    println!("{}", add(2, 3));      // 5 (no math:: prefix needed)
    println!("{}", power(2, 10));   // 1024
}

// use multiple at once
use math::{add, subtract};

// use everything
use math::*;

// alias
use math::add as plus;
println!("{}", plus(2, 3));   // 5
```

pub keyword — visibility:

```rust
mod greet {
    pub fn hello() { }      // ✅ public, accessible outside
        fn secret() { }     // ❌ private, only inside mod
    pub(crate) fn internal() { }  // accessible within crate only
}
```
