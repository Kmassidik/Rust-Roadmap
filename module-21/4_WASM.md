#### wasm-bindgen — JS ↔ Rust interop glue:

```rust
use wasm_bindgen::prelude::*;

#[wasm_bindgen]
pub fn add(a: i32, b: i32) -> i32 {
    a + b
}
```

Generates the JS bindings so `add()` is callable directly from JavaScript after compiling to WASM. Handles the annoying parts (string/type marshalling across the JS/WASM boundary).

---

#### wasm-pack — the build tool:

```bash
wasm-pack build --target web
```

Takes a Rust crate using `wasm-bindgen` and packages it into an npm-publishable WASM package (`pkg/` folder with `.wasm`, `.js` glue, and `package.json`). This is the tool, `wasm-bindgen` is the library it builds on top of.

---

#### wasmer — a WASM *runtime*, different role entirely:

⚠️ Don't confuse this with the two above. `wasm-bindgen`/`wasm-pack` are for compiling Rust **into** WASM for the browser. `wasmer` **runs** WASM modules outside the browser (server-side, plugin systems, sandboxed execution) — same target format, opposite direction.

```rust
use wasmer::{Store, Module, Instance, imports};

let mut store = Store::default();
let module = Module::from_file(&store, "module.wasm")?;
let instance = Instance::new(&mut store, &module, &imports! {})?;
```
