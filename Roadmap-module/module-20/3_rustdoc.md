#### Doc comments generate HTML docs AND double as tests:

```rust
//! Module-level docs (goes at the top of a file/module)

/// Adds two numbers together.
///
/// # Examples
///
/// ```
/// let result = my_crate::add(2, 3);
/// assert_eq!(result, 5);
/// ```
pub fn add(a: i32, b: i32) -> i32 {
    a + b
}
```

#### Build and view the docs:

```bash
cargo doc --open        # builds docs for your crate AND all dependencies, opens in browser
cargo doc --no-deps     # skip dependency docs (faster)
```

#### Doctests — the code inside ` ``` ` fences in doc comments actually runs as a test:

```bash
cargo test              # runs doctests alongside unit/integration tests
cargo test --doc        # run ONLY doctests
```

✅ If the example in your doc comment goes stale (function signature changes, wrong output), `cargo test` fails — docs can't silently rot.

Use `//!` for module/crate-level docs, `///` for items (functions, structs, enums) directly above them.
