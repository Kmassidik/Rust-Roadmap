```rust
// assert equality
assert_eq!(2 + 2, 4);            // ✅ equal
assert_ne!(2 + 2, 5);            // ✅ not equal

// assert boolean
assert!(true);                   // ✅ passes
assert!(2 > 1);                  // ✅ passes

// custom message
assert_eq!(
    add(2, 3), 5,
    "add({}, {}) should be 5", 2, 3   // shown if fails
);

// assert with Result
fn test_result() -> Result<(), String> {
    if 2 + 2 == 4 {
        Ok(())
    } else {
        Err(String::from("math is broken!"))
    }
}
```
