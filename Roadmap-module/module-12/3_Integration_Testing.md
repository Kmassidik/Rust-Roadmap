#### Tests in a separate tests/ folder — tests the public API:

```
src/
├── lib.rs       ← your library code
tests/
├── integration_test.rs   ← integration tests
```

```rust
use my_crate::multiply;
use my_crate::greet;

#[test]
fn test_multiply() {
    assert_eq!(multiply(3, 4), 12);
    assert_eq!(multiply(0, 5), 0);
}

#[test]
fn test_greet() {
    assert_eq!(greet("Alice"), "Hello, Alice!");
    assert_eq!(greet("Rust"),  "Hello, Rust!");
}
```

#### Run integration tests:

```rust
#[cfg(test)]
mod tests {
    use super::*;

    // group related tests
    mod math_tests {
        use super::*;

        #[test]
        fn test_add()      { assert_eq!(add(1, 2), 3); }

        #[test]
        fn test_subtract() { assert_eq!(subtract(5, 2), 3); }
    }

    mod string_tests {
        use super::*;

        #[test]
        fn test_greet() {
            assert_eq!(greet("Alice"), "Hello, Alice!");
        }
    }
}
```
