#### Tests live inside the same file as the code:

```rust
// src/main.rs or src/lib.rs

fn add(a: i32, b: i32) -> i32 {
    a + b
}

fn is_even(n: i32) -> bool {
    n % 2 == 0
}

fn divide(a: f64, b: f64) -> Option<f64> {
    if b == 0.0 { None } else { Some(a / b) }
}

#[cfg(test)]              // only compile when running tests
mod tests {
    use super::*;         // import everything from parent module

    #[test]               // marks this as a test function
    fn test_add() {
        assert_eq!(add(2, 3), 5);        // ✅ passes
    }

    #[test]
    fn test_is_even() {
        assert!(is_even(4));             // passes if true
        assert!(!is_even(3));            // passes if false
    }

    #[test]
    fn test_divide() {
        assert_eq!(divide(10.0, 2.0), Some(5.0));
        assert_eq!(divide(10.0, 0.0), None);
    }

    #[test]
    #[should_panic]       // test PASSES if code panics
    fn test_panic() {
        panic!("this should panic!");
    }

    #[test]
    #[ignore]             // skip this test
    fn test_slow() {
        // some slow test
    }
}
```

#### Run tests:

```bash
cargo test                    # run all tests
cargo test test_add           # run specific test
cargo test tests::            # run all tests in module
cargo test -- --show-output   # show println! output
cargo test -- --ignored       # run ignored tests
```
