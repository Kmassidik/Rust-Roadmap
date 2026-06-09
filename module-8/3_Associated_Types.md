Cleaner than generics for one-to-one type relationships:

```rust
trait Container {
    type Item;   // associated type

    fn first(&self) -> Option<&Self::Item>;
    fn last(&self)  -> Option<&Self::Item>;
    fn count(&self) -> usize;
}

struct Stack<T> {
    items: Vec<T>,
}

impl<T> Container for Stack<T> {
    type Item = T;   // define what Item is

    fn first(&self) -> Option<&T> {
        self.items.first()
    }

    fn last(&self) -> Option<&T> {
        self.items.last()
    }

    fn count(&self) -> usize {
        self.items.len()
    }
}

// usage
let mut s = Stack { items: vec![1, 2, 3] };
println!("{:?}", s.first());   // output → Some(1)
println!("{:?}", s.last());    // output → Some(3)
println!("{}", s.count());     // output → 3
```
