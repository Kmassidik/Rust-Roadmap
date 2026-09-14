```rust
let scores: [u32; 5] = [90, 88, 89, 77, 55];

// access
println!("{}", scores[0]); // 90

// length
println!("{}", scores.len()); // 5

// fill with the same value
let zeros = [0; 5]; // [0,0,0,0,0]

// iterate
for score in scores.iter(){
    println!("{}", score);
}

// slices
let slice = &scores[1..3] // 88, 89
```
