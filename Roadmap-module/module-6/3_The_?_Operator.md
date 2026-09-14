Shortcut for propagating errors up the call stack:

```rust
use std::num::ParseIntError;

// without ?
fn parse_without(s: &str) -> Result<i32, ParseIntError> {
    match s.trim().parse::<i32>() {
        Ok(n)  => Ok(n * 2),
        Err(e) => Err(e),
    }
}

// with ? (much cleaner!)
fn parse_with(s: &str) -> Result<i32, ParseIntError> {
    let n = s.trim().parse::<i32>()?;  // returns Err early if fails
    Ok(n * 2)
}

// chaining ?
fn read_and_double(s: &str) -> Result<i32, ParseIntError> {
    let a = s.trim().parse::<i32>()?;
    let b = a.checked_mul(2).ok_or("overflow".parse::<i32>().unwrap_err())?;
    Ok(b)
}

⚠️ ? only works in functions that return Result or Option!
```
