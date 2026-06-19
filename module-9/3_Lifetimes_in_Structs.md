If a struct holds a reference, it needs a lifetime too:

```rust
struct Excerpt<'a> {
    text: &'a str,
}

impl<'a> Excerpt<'a> {
    fn announce(&self) -> &str {
        println!("Attention please: {}", self.text);
        // output → Attention please: call me ishmael
        self.text
    }
}

fn main() {
    let novel = String::from("call me ishmael. some years ago...");
    let first_sentence = novel.split('.').next().unwrap();

    let excerpt = Excerpt { text: first_sentence };
    excerpt.announce();
}
```

This means: Excerpt cannot outlive the string it's borrowing from.
