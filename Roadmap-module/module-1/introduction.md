# What is Rust?  
  
Rust is a systems programming language created by Mozilla Research, first released in 2015.  
  
It is designed around three core goals:  
  
- Speed — comparable to C and C++  
- Safety — prevents memory bugs and crashes  
- Concurrency — safe multi-threading without data races  
  
> Think of Rust as C++ without the footguns.  
  
---  
  
# Why Use Rust?  
  
Rust solves common problems found in other languages:  
  
| Problem (Other Languages) | Rust Solution |  
|--------------------------|--------------|  
| Memory leaks (C/C++) | Ownership system manages memory automatically |  
| Null pointer crashes | No `null` — uses `Option<T>` |  
| Data races in threads | Borrow checker prevents them at compile time |  
| Slow performance (Python, JS) | Compiles to native machine code |  
  
Rust has been voted the most loved language on Stack Overflow surveys for multiple years.  
  
---  
  
# Key Concepts in Rust  
  
## Ownership  
  
Every value in Rust has a single owner.  
  
```rust  
let s = String::from("hello");
```

- When the owner goes out of scope, memory is freed
- Prevents memory leaks automatically

---

## Borrowing

You can borrow values instead of taking ownership:
```rust
fn print_value(s: &String) {  
    println!("{}", s);  
}
```

- `&T` = immutable reference
- `&mut T` = mutable reference

---

## Lifetimes

Ensure references are always valid:
```rust
fn longest<'a>(x: &'a str, y: &'a str) -> &'a str {  
    if x.len() > y.len() { x } else { y }  
}
```
---

## Pattern Matching

Rust has powerful pattern matching via `match`:
```rust
match number {  
    1 => println!("One"),  
    2 => println!("Two"),  
    _ => println!("Other"),  
}
```

---

# Installing Rust

## Linux / macOS

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

## Windows

Download and run:

```bash
rustup-init.exe
```

## Verify Installation

```bash
rustc --version  
cargo --version
```

---

# What is Cargo?
Cargo is Rust’s package manager and build system.
## Common Commands

```rust
cargo new my_project  
cargo build  
cargo run  
cargo test  
cargo add serde
```

Think of it like npm for Node.js, but built into Rust.

---

# Project Structure

```
my_project/  
├── Cargo.toml  
└── src/  
    └── main.rs
```
---

# Example Program

```rust
fn main() {  
    println!("Hello, world!");  
}
```

Run it:

```rust
cargo run
```

---

# Error Handling

Rust avoids exceptions. It uses:
## Result

```rust
fn divide(a: f64, b: f64) -> Result<f64, String> {  
    if b == 0.0 {  
        Err("Cannot divide by zero".to_string())  
    } else {  
        Ok(a / b)  
    }  
}
```

## Option

```rust
let value: Option<i32> = Some(10);
```

---

# Concurrency in Rust

Rust makes multi-threading safe:

```rust
use std::thread;  
  
fn main() {  
    let handle = thread::spawn(|| {  
        println!("Hello from a thread!");  
    });  
  
    handle.join().unwrap();  
}
```

---

# IDEs & Tools

|Tool|Recommendation|
|---|---|
|VS Code|Install rust-analyzer|
|RustRover|JetBrains IDE for Rust|
|Neovim|Use with LSP|

---

# Rust Playground

Try Rust without installing anything:

[https://play.rust-lang.org](https://play.rust-lang.org)

---

# Where Rust is Used

- Systems programming (OS, drivers)
- Web backends (APIs)
- Game engines
- Security tools
- CLI tools

---

# Pros & Cons

## Pros

- Memory safe without garbage collection
- Extremely fast
- Strong type system
- Great tooling (Cargo)

## Cons

- Steep learning curve
- Borrow checker can be frustrating at first
- Compilation can be slower
