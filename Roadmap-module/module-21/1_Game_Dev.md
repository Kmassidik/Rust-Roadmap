#### bevy — ECS-based engine, the community favorite (2026: most active, most learning material):

```rust
use bevy::prelude::*;

fn main() {
    App::new()
        .add_plugins(DefaultPlugins)
        .add_systems(Startup, setup)
        .run();
}

fn setup(mut commands: Commands) {
    commands.spawn(Camera2dBundle::default());
}
```

✅ Everything is Entities + Components + Systems — no inheritance, just data + functions that operate on it.

---

#### fyrox — batteries-included engine, ships its own scene editor:

- Closer to Unity/Godot workflow (drag-drop editor) than bevy's code-first ECS
- Good if you want a GUI editor without leaving Rust

---

#### ggez — simple 2D, "good old games" style:

```rust
use ggez::{Context, GameResult, event};

struct State;
impl event::EventHandler<ggez::GameError> for State {
    fn update(&mut self, _ctx: &mut Context) -> GameResult { Ok(()) }
    fn draw(&mut self, _ctx: &mut Context) -> GameResult { Ok(()) }
}
```

Minimal abstraction over 2D drawing — closest thing to LÖVE2D in Rust.

---

#### macroquad — the simplest option, great for jams:

```rust
use macroquad::prelude::*;

#[macroquad::main("MyGame")]
async fn main() {
    loop {
        clear_background(BLACK);
        draw_circle(100.0, 100.0, 15.0, YELLOW);
        next_frame().await
    }
}
```

⚠️ No ECS, no plugin system — just draw calls in a loop. Compiles to WASM with almost no extra config, popular for game jams.

---

#### wgpu-rs — NOT a game engine, the GPU abstraction underneath:

- Cross-platform graphics API (targets Vulkan/Metal/DX12/WebGPU under one interface)
- bevy, fyrox and others use it internally for rendering
- Reach for it directly only if you're building your own renderer/engine, not a game
