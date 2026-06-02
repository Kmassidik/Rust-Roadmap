Group related data together:

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

Struct update syntax:

```rust
let p3 = Person {
    name: String::from("Charlie"),
    ..p2   // copy remaining fields from p2
};
```

Tuple struct:

```rust
struct Point(f64, f64);

let p = Point(1.0, 2.0);
println!("{} {}", p.0, p.1);
```
