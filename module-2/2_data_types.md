# Data Types — Complete

#### Integers

|Type|Size|Range|
|---|---|---|
|`i8`|8-bit|-128 to 127|
|`i16`|16-bit|-32,768 to 32,767|
|`i32`|32-bit|-2.1B to 2.1B|
|`i64`|64-bit|very large|
|`i128`|128-bit|huge|
|`isize`|arch|depends on OS|
|`u8`|8-bit|0 to 255|
|`u16`|16-bit|0 to 65,535|
|`u32`|32-bit|0 to 4.3B|
|`u64`|64-bit|very large|
|`u128`|128-bit|huge|
|`usize`|arch|depends on OS|

```rust
let a: i32 = -10;
let b: u8  = 255;
let c      = 100_000;   // underscore for readability
let d      = 0xff;      // hex
let e      = 0o77;      // octal
let f      = 0b1111;    // binary
```

#### Floats

```rust
let x: f32 = 3.14;   // 32-bit float
let y: f64 = 3.14;   // 64-bit float (default)
```

#### Boolean

```rust
let t: bool = true;
let f: bool = false;
```

#### Character

```rust
let c: char = 'A';
let emoji: char = '🦀';  // supports unicode!
```

#### String Types

```rust
let s1: &str = "hello";              // string slice, immutable, hardcoded
let s2: String = String::from("hello");  // owned String, heap allocated
let s3 = s2.clone();                 // clone a String
let s4 = &s2;                        // borrow a String as &str

// useful String methods
s2.len();           // length
s2.is_empty();      // check if empty
s2.contains("hi");  // check substring
s2.to_uppercase();  // HELLO
s2.trim();          // remove whitespace
s2.replace("hello", "world");
```
---
