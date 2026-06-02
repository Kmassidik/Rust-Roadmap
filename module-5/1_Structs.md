```rust
// basic struct
struct Person {
    name: String,
    age : u32,
};

// create instance
let p = Person {
    name: String::from("Kurnia"),
    age : 20,
};

// access failed
println!("{} is {}", p.name, p.age);

// mutable struct
let mut p2 = Person {
    name: String::from("Bob"),
    age:  25,
};

p2.age = 26;   // can modify if mut
```
