Instead of moving, borrow with &:

```rust
fn print(s: &String) {     // borrows, doesn't take ownership
    println!("{}", s);
}   // s NOT dropped here, just borrow ends

let s1 = String::from("hello");
print(&s1);                // pass reference

println!("{}", s1);        // s1 still exists!
```

Borrowing rules:

```txt
1. You can have MANY immutable references (&T)
2. OR ONE mutable reference (&mut T)
3. But NOT both at the same time
```
