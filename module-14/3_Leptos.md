#### Rust's answer to React/SolidJS — full-stack reactive framework, compiles to WASM for the browser and can also render server-side:

```rust
use leptos::*;

#[component]
fn Counter() -> impl IntoView {
    let (count, set_count) = create_signal(0);

    view! {
        <button on:click=move |_| set_count.update(|n| *n += 1)>
            "Clicks: " {count}
        </button>
    }
}
```

- `create_signal` = reactive state — reading `count` (via `count.get()` or `{count}` in the view) auto-tracks it, updating it via `set_count` re-renders only what depends on it (fine-grained reactivity, no virtual DOM diffing).
- `#[component]` marks a function as a UI component — same idea as a React function component.

#### Server-side rendering (SSR) — same component tree runs on server and client:

```rust
#[component]
fn App() -> impl IntoView {
    view! {
        <Router>
            <Routes>
                <Route path="/" view=Counter/>
            </Routes>
        </Router>
    }
}
```

⚠️ SSR setup is heavier than a plain SPA — typically wired through Axum or Actix as the backing server (`leptos_axum` / `leptos_actix` crates handle the integration).

✅ Much newer than Axum/Actix (mainstream since ~2023), but the appeal is writing one Rust codebase for both frontend and backend — no separate JS build step, no TypeScript.
