A type that can be **one of several variants**:

```rust
enum Direction {
  North,
  South,
  East,
  West,
}

let dir =  Direction::North;

// Enum  with data
enum Shape {
  Circle(f64),              // radius
  Rectangle(f64, f64),      // width, height
  Triangle(f64, f64, f64),
}

let c = Shape::Circle(5.0);
let r = Shape::Rectangle(3.0, 4.0);
```

Match with enum:

```rust
let shape = Shape::Circle(5.0);

match shape {
  Shape::Circle(r) => println!("Circle r={}", r),
  Shape::Rectangle(w, h) => println!("Rectangle {}x{}", w, r),
  Shape::Triangle(a, b, c) => println!("Triangle"),
}
```
