#### tauri — Electron alternative, web frontend + Rust backend:

```rust
#[tauri::command]
fn greet(name: &str) -> String {
    format!("Hello, {}!", name)
}

fn main() {
    tauri::Builder::default()
        .invoke_handler(tauri::generate_handler![greet])
        .run(tauri::generate_context!())
        .expect("error while running tauri application");
}
```

✅ Frontend is HTML/CSS/JS (React, Vue, whatever) — Rust just handles the native backend and system access.
✅ Binaries are dramatically smaller than Electron (no bundled Chromium — uses the OS's own webview).

---

#### gtk-rs — bindings to GTK, native look on Linux:

```rust
use gtk::prelude::*;
use gtk::{Application, ApplicationWindow, Button};

let app = Application::builder().application_id("com.example").build();
app.connect_activate(|app| {
    let window = ApplicationWindow::builder().application(app).title("Hi").build();
    window.present();
});
```

Real native widgets, not a webview — best fit when you specifically want a GNOME/Linux-native feel.

---

#### relm — Elm-architecture wrapper over gtk-rs:

⚠️ Much less active than the other two — check the repo's last commit before depending on it for anything new. Model-Update-View pattern (like Elm/Redux) on top of gtk-rs, appealing if you already think in that pattern, but gtk-rs directly or tauri are the safer defaults today.
