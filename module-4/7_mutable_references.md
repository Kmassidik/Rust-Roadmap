```rust
fn change(s: &mut String) {
    s.push_str("Hello World");
}

let mut s = String::from("Hello");
change(&mut s);

println!("{}", s);
```

can't have two mutable references at once:

```rust
let mut s = String::from("hello");

let r1 = &mut s;
let r2 = &mut s; // error! only one &mut allowed

println!("{} {}", r1, r2);
```

can't mix mutable and immutable:

```rust
let mut s = String::from("hello");

let r1 = &s;
let r2 = &mut s; // error! cant mix

println!("{} {}", r1, r2);
```
