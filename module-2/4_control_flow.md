# Control Flow — Complete

#### if / else if / else

```rust
let x = 10;

if x > 0 {
    println!("positive");
} else if x < 0 {
    println!("negative");
} else {
    println!("zero");
}

// if as expression (assign result)
let msg = if x > 0 { "positive" } else { "not positive" };
```

#### loop

```rust
// basic infinite loop
loop {
    println!("forever");
    break;
}

// loop with return value
let result = loop {
    let x = 5;
    break x * 2;   // returns 10
};

// labeled loops (for nested)
'outer: loop {
    loop {
        break 'outer;   // breaks the outer loop
    }
}
```

#### while

```rust
let mut i = 0;
while i < 5 {
    println!("{}", i);
    i += 1;
}

// while let
let mut stack = vec![1, 2, 3];
while let Some(top) = stack.pop() {
    println!("{}", top);
}
```

#### for

```rust
// range
for i in 0..5 {       // 0,1,2,3,4 (exclusive)
    println!("{}", i);
}
for i in 0..=5 {      // 0,1,2,3,4,5 (inclusive)
    println!("{}", i);
}

// iterate over array
let arr = [10, 20, 30];
for item in arr.iter() {
    println!("{}", item);
}

// with index
for (i, item) in arr.iter().enumerate() {
    println!("{}: {}", i, item);
}

// reverse
for i in (0..5).rev() {
    println!("{}", i);   // 4,3,2,1,0
}
```

#### break & continue

```rust
for i in 0..10 {
    if i == 3 { continue; }   // skip 3
    if i == 7 { break; }      // stop at 7
    println!("{}", i);
}
```
