**First understand where data lives.**

**Stack** — fast, fixed size, automatic cleanup:

```rust
let x = 5;        // lives on stack
let y = true;     // lives on stack
let z = 3.14;     // lives on stack
```

**Heap** — slower, dynamic size, needs management:

```rust
let s = String::from("hello");  // lives on heap
let v = vec![1, 2, 3];          // lives on heap
```

| Stack | Heap |
|---|---|
| Size fixed at compile time | Dynamic at runtime |
| Fast ⚡ | Slower |
| Examples: `i32`, `bool`, `f64`, `char` | Examples: `String`, `Vec`, `HashMap` |
| Cleanup automatic | Managed by ownership |
