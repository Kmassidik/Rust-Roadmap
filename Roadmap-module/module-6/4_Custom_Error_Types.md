Define your own error types:

```rust
use std::fmt;

// custom error enum
#[derive(Debug)]
enum AppError {
    NotFound(String),
    InvalidInput(String),
    ParseError(String),
}

// implement Display for AppError
impl fmt::Display for AppError {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        match self {
            AppError::NotFound(msg)     => write!(f, "Not found: {}", msg),
            AppError::InvalidInput(msg) => write!(f, "Invalid input: {}", msg),
            AppError::ParseError(msg)   => write!(f, "Parse error: {}", msg),
        }
    }
}

// implement Error trait
impl std::error::Error for AppError {}

// usage
fn find_user(id: u32) -> Result<&'static str, AppError> {
    match id {
        1 => Ok("Alice"),
        2 => Ok("Bob"),
        _ => Err(AppError::NotFound(format!("User {} not found", id))),
    }
}
```

---

**Quick Summary**

```text
Option  → value may or may not exist   → Some(T) | None
Result  → operation may fail           → Ok(T) | Err(E)
?       → propagate error early        → return Err automatically
Custom  → define your own error types  → enum + Display + Error
```
