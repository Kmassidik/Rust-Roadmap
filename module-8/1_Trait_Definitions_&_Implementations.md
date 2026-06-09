Already touched in Module 5 — let's go deeper:

```rust
trait Animal {
    // required method (must implement)
    fn name(&self) -> &str;
    fn sound(&self) -> &str;

    // default method (optional override)
    fn introduce(&self) -> String {
        format!("I am {} and I say {}", self.name(), self.sound())
        // output → I am Cat and I say Meow
    }
}

struct Cat;
struct Dog;

impl Animal for Cat {
    fn name(&self)  -> &str { "Cat" }
    fn sound(&self) -> &str { "Meow" }
}

impl Animal for Dog {
    fn name(&self)  -> &str { "Dog" }
    fn sound(&self) -> &str { "Woof" }

    // override default
    fn introduce(&self) -> String {
        format!("WOOF! I am {}!", self.name())
        // output → WOOF! I am Dog!
    }
}
```

Multiple traits:

```rust
trait Swim {
    fn swim(&self) -> String;
}

trait Fly {
    fn fly(&self) -> String;
}

struct Duck;

impl Swim for Duck {
    fn swim(&self) -> String {
        String::from("Duck is swimming!")   // output → Duck is swimming!
    }
}

impl Fly for Duck {
    fn fly(&self) -> String {
        String::from("Duck is flying!")     // output → Duck is flying!
    }
}
```
