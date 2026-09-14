# Pattern Matching — Complete

#### match

```rust
let x = 5;

match x {
    1       => println!("one"),
    2 | 3   => println!("two or three"),   // multiple patterns
    4..=6   => println!("four to six"),    // range
    _       => println!("other"),          // wildcard/default
}

// match as expression
let msg = match x {
    1 => "one",
    _ => "other",
};

// match with binding
match x {
    n @ 1..=10 => println!("got {} in range", n),
    _          => println!("out of range"),
}
```

#### Destructuring

```rust
// tuple destructuring
let (a, b, c) = (1, 2, 3);

// struct destructuring
struct Point { x: i32, y: i32 }
let p = Point { x: 10, y: 20 };
let Point { x, y } = p;

// ignore values with _
let (first, _, third) = (1, 2, 3);
```

#### if let (single pattern match)

```rust
let number = Some(7);

if let Some(n) = number {
    println!("got {}", n);
} else {
    println!("nothing");
}
```
