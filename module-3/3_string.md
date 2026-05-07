```rust
// &str -- immutable, hardcode
let s1: &str = "hello";

// String — owned, heap allocated, mutable
let mut s2 = String::from("hello");

// Methods
s2.push("!");                           // push char
s2.push_str(" world");                  // push string
s2.len();                               // length
s2.is_empty();                          // check empty
s2.contains("worlds");                  // check substring
s2.replace("worlds", "rust");           // replace
s2.to_uppercase();                      // Hello
s2.to_lowercase();                      // hello
s2.trim();                              // remove whitespace
s2.split(" ").collect::<Vec<&str>>();   // split into vec

// more deep into split sample
let s = String::from("hello world foo");
let words = s.split(" ").collect::<Vec<&str>>();
println!("{:?}", words); // ["hello", "world", "foo"]

// Concatenation first example
let s3 = String::from("hello "); 
let s4 = String::from("world"); 
let s5 = s3 + &s4; // s3 is moved! 
let s6 = format!("{} {}", "hello", "world"); // safer way next here

// s3 + &s4 — s3 is consumed/moved after this, you can't use s3 anymore:
rustlet s3 = String::from("hello ");
let s4 = String::from("world");
let s5 = s3 + &s4;

println!("{}", s5);  // ✅ "hello world"
println!("{}", s3);  // ❌ error! s3 is moved, gone!
println!("{}", s4);  // ✅ fine, s4 still exists

// That's why format! is safer — nothing gets moved:
rustlet s3 = String::from("hello ");
let s4 = String::from("world");
let s6 = format!("{} {}", s3, s4);

println!("{}", s6);  // ✅ "hello world"
println!("{}", s3);  // ✅ still exists!
println!("{}", s4);  // ✅ still exists!
```
