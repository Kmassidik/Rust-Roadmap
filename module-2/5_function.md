# Functions — Complete

```rust
// basic function
fn greet() {
    println!("Hello!");
}

// with parameters
fn add(a: i32, b: i32) -> i32 {
    a + b   // implicit return (no semicolon)
}

// explicit return
fn check(x: i32) -> bool {
    if x > 0 {
        return true;   // early return
    }
    false
}

// multiple return values (via tuple)
fn min_max(arr: &[i32]) -> (i32, i32) {
    (*arr.iter().min().unwrap(), *arr.iter().max().unwrap())
}
let (min, max) = min_max(&[3, 1, 4, 1, 5]);

// nested functions
fn outer() {
    fn inner() {
        println!("inner!");
    }
    inner();
}
```
