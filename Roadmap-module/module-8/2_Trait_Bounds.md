Restrict generics to only types that implement certain traits:

```rust
use std::fmt::Display;

// only accept types that implement Display
fn print_item<T: Display>(item: T) {
    println!("{}", item);   // output → whatever item is
}

// multiple bounds with +
fn print_both<T: Display + Clone>(item: T) {
    let copy = item.clone();
    println!("{}", copy);   // output → whatever item is
}

// where clause (cleaner for complex bounds)
fn compare<T>(a: T, b: T) -> bool
where
    T: Display + PartialOrd,
{
    println!("Comparing {} and {}", a, b);  // output → Comparing 5 and 10
    a > b
}
```

Returning traits with impl Trait:

```rust
fn make_animal() -> impl Animal {
    Cat   // returns something that implements Animal
}

fn make_sound(is_cat: bool) -> Box<dyn Animal> {
    if is_cat {
        Box::new(Cat)
    } else {
        Box::new(Dog)
    }
}
```
