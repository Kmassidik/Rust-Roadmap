Rust often infers lifetimes so you don't have to write them. 3 rules:

```txt
Rule 1: each reference parameter gets its own lifetime
Rule 2: if there's exactly ONE input lifetime, it's assigned to all outputs
Rule 3: if one param is &self or &mut self, its lifetime is assigned to all outputs
```

```rust
// you write this:
fn first_word(s: &str) -> &str {
    &s[..1]
}

// compiler actually sees this (rule 2 applied):
fn first_word<'a>(s: &'a str) -> &'a str {
    &s[..1]
}

// method example (rule 3 applied):
impl<'a> Excerpt<'a> {
    fn get_text(&self) -> &str {   // no need to write <'a> here!
        self.text
    }
}
```

That's why most code never shows explicit lifetimes — elision handles it automatically. You only write 'a when the compiler can't figure out the relationship (like the longest function with 2 params).
