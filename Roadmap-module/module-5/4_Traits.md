Define shared behavior across types — like interfaces:

```rust
// define trait
trait Greet {
    fn hello(&self) -> String;           // must implement
    fn bye(&self) -> String {            // optional, has default
        String::from("Goodbye!")
    }
}

// implement for Person
struct Person {
    name: String,
}

impl Greet for Person {
    fn hello(&self) -> String {
        format!("Hello, I am {}!", self.name)
    }
}

// implement for Robot
struct Robot {
    id: u32,
}

impl Greet for Robot {
    fn hello(&self) -> String {
        format!("BEEP BOOP I am Robot #{}", self.id)
    }
}

// usage
let p = Person { name: String::from("Alice") };
let r = Robot  { id: 42 };

println!("{}", p.hello());   // Hello, I am Alice!
println!("{}", r.hello());   // BEEP BOOP I am Robot #42
println!("{}", p.bye());     // Goodbye! (default)
println!("{}", r.bye());     // Goodbye! (default)
```

Trait as parameter:

```rust
fn introduce(item: &impl Greet) {
    println!("{}", item.hello());
}

introduce(&p);   // ✅
introduce(&r);   // ✅
```

**Quick Summary**

```text
Struct  → group related data together
Enum    → one of several variants
Impl    → add methods to struct/enum
Trait   → define shared behavior across types
```
