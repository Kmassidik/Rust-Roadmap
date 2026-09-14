if you want a deep copy of heap data:

```rust
let s1 = String ::from("hello");
let s2 = s1.clone();  // explicit deep copy

println!("{}", s1);   // still exists
println!("{}", s2);   // still exists
```

Clone is expensive! copies all heap data. Use only when needed. 
