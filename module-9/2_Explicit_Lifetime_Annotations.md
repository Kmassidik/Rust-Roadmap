Syntax: 'a (apostrophe + name, usually lowercase letter)

```rust
// without lifetime — won't compile!
fn longest(x: &str, y: &str) -> &str {
    if x.len() > y.len() { x } else { y }
}
// ❌ error: missing lifetime specifier

// with lifetime — compiles!
fn longest<'a>(x: &'a str, y: &'a str) -> &'a str {
    if x.len() > y.len() { x } else { y }
}

fn main() {
    let s1 = String::from("hello");
    let s2 = String::from("world!");

    let result = longest(s1.as_str(), s2.as_str());
    println!("Longest: {}", result);
    // output → Longest: world!
}
```

What 'a means here: the returned reference will live at most as long as the shorter of x and y. It's not changing lifetimes — just describing the relationship to the compiler.

```rust
fn main() {
    let s1 = String::from("long string");
    let result;
    {
        let s2 = String::from("short");
        result = longest(s1.as_str(), s2.as_str());
    }   // s2 dropped here
    println!("{}", result);   // ❌ error! result might reference s2
}
```
