passing to a function moves ownership:

```rust
fn take(s: String){
  println!("{}", s)
} // s dropped here

let s1 = String::from("hello");
take(s1);           // s1 moved into function

println!("{}", s1); // error! s1 is gone
```

Returning gives back ownership:

```rust
fn give() -> String {
  String::from("Hello"); // ownership moves to caller
}

let s = give();      // s owns the String
println!("{}", s);   // fine
```
