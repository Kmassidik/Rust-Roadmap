A slices is a references to a part of collection:

```rust
// string slice
let s = String::from("hello world");
let hello = &s[0..5];    // "hello"
let world = &s[6..11];   // "world"

// shortcuts
let hello = &s[..5];     // from start
let world = &s[6..];     // to end
let all   = &s[..];      // entire string

// array slice
let arr = [1, 2, 3, 4, 5];
let slice = &arr[1..3];  // [2, 3]
```
