```rust
use std::ops::Add;

// generic add function using Add trait
fn add_items<T: Add<Output = T>>(a: T, b: T) -> T {
    a + b
}

println!("{}", add_items(1, 2));         // output → 3
println!("{}", add_items(1.5, 2.5));     // output → 4.0
println!("{}", add_items("hi", "!"));    // ❌ &str doesn't impl Add

// newtype pattern
struct Meters(f64);
struct Kilograms(f64);

impl Add for Meters {
    type Output = Meters;
    fn add(self, other: Meters) -> Meters {
        Meters(self.0 + other.0)
    }
}

let m1 = Meters(1.5);
let m2 = Meters(2.5);
let m3 = m1 + m2;
println!("{}", m3.0);   // output → 4.0
```

**Quick Summary**

```
Trait           → define shared behavior
Trait Bound     → restrict generics to specific traits  <T: Trait>
Associated Type → one-to-one type in trait              type Item
Generics        → write code for any type               <T>
impl Trait      → return/accept trait without naming type
dyn Trait       → dynamic dispatch, runtime polymorphism
```
