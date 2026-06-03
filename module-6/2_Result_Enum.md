Used when an operation might fail:

```rust
// definition (built into Rust)
enum Result<T, E> {
    Ok(T),    // success with value
    Err(E),   // failure with error
}

// example
let ok:  Result<i32, &str> = Ok(42);
let err: Result<i32, &str> = Err("something went wrong");

// access with match
match ok {
    Ok(v)  => println!("Value: {}", v),
    Err(e) => println!("Error: {}", e),
}

// unwrap (dangerous! panics if Err)
let v = ok.unwrap();

// unwrap_or (safe, provides default)
let v = ok.unwrap_or(0);

// expect (like unwrap but custom panic message)
let v = ok.expect("failed to get value");

// is_ok / is_err
ok.is_ok();    // true
ok.is_err();   // false

// map (transform Ok value)
let doubled = ok.map(|v| v * 2);   // Ok(84)

// map_err (transform Err value)
let mapped = err.map_err(|e| format!("ERROR: {}", e));
```
