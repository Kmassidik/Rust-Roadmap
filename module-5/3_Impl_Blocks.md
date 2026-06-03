```rust
struct Rectangle {
    width:  f64,
    height: f64,
}

impl Rectangle {
    // associated function (no self) → like a constructor
    fn new(width: f64, height: f64) -> Rectangle {
        Rectangle { width, height }
    }

    // method (has self) → called on instance
    fn area(&self) -> f64 {
        self.width * self.height
    }

    fn perimeter(&self) -> f64 {
        2.0 * (self.width + self.height)
    }

    fn is_square(&self) -> bool {
        self.width == self.height
    }

    // mutable method
    fn scale(&mut self, factor: f64) {
        self.width  *= factor;
        self.height *= factor;
    }
}

// usage
let mut rect = Rectangle::new(3.0, 4.0);
println!("area: {}",      rect.area());
println!("perimeter: {}", rect.perimeter());
println!("is square: {}", rect.is_square());

rect.scale(2.0);
println!("scaled width: {}", rect.width);  // 6.0
```
