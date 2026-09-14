Declarative macros — pattern-match on Rust syntax and expand into code at compile time:

```rust
macro_rules! square {
    ($x:expr) => {
        $x * $x
    };
}

fn main() {
    println!("{}", square!(5));   // output → 25
}
```

#### Repetition — build a `Vec` like the real `vec!` macro:

```rust
macro_rules! my_vec {
    ( $( $x:expr ),* ) => {
        {
            let mut v = Vec::new();
            $( v.push($x); )*
            v
        }
    };
}

fn main() {
    let v = my_vec![1, 2, 3];
    println!("{:?}", v);   // output → [1, 2, 3]
}
```

- `$x:expr` — captures an expression fragment
- `$( ... )*` — repeat zero or more times, comma-separated
- other fragment specifiers: `ident`, `ty`, `block`, `stmt`, `pat`, `literal`

#### Multiple match arms — like a mini logging macro:

```rust
macro_rules! log {
    (info, $msg:expr) => {
        println!("[INFO] {}", $msg)
    };
    (error, $msg:expr) => {
        println!("[ERROR] {}", $msg)
    };
}

fn main() {
    log!(info, "server started");
    log!(error, "connection lost");
}
```

⚠️ Macros expand before type-checking — errors inside a macro can point to confusing locations. Use `cargo expand` to see the generated code.
