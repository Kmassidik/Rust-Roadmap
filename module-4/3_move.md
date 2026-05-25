when you assign heap data to another variable, ownership moves:

```rust
let s1 : String::from("hello");
let s2 = s1;  // ownership MOVES to s2

println!("{}", s1);  // error! s1 is gone
println!("{}", s2);  // fine
```

but stack data copies instead of moving:

```rust
let x = 5;
let y = x;  // copy (not move, i32 is on stack)

println!("{}", x); // fine, x still exists
println!("{}", y); // fine
```
