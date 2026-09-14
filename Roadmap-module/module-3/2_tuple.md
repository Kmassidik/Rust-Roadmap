```rust
let person: (&str, i32, f64) = ("Alice", 20, 5.9);

// access by index
println!("{}", person.0); // Alice
println!("{}", person,1); // 20

// destructing
let (name, age, height) = person;
println!("{} is {} years old", name, age); // Alice is 20 years old

// unit tuple (empty)
let unit = ();
```

- noted : Fixed size, can mix types:
