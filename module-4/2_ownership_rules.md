Rust has 3 golden rules:

```noted
1. Every value has ONE owner
2. Only ONE owner at a time
3. When owner goes out of scope -> value is dropped
```

```rust
{
   let s = String::from("hello"); // s is owner
   // use s here
}  // s dropped here, memory freed 
```
