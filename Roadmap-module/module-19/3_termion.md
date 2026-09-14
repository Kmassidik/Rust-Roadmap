#### Low-level terminal control — raw mode, cursor movement, colors — with almost no dependencies:

```rust
use std::io::{stdin, stdout, Write};
use termion::raw::IntoRawMode;
use termion::input::TermRead;
use termion::event::Key;

fn main() {
    let mut stdout = stdout().into_raw_mode().unwrap();
    let stdin = stdin();

    write!(stdout, "Press 'q' to quit\r\n").unwrap();
    stdout.flush().unwrap();

    for key in stdin.keys() {
        match key.unwrap() {
            Key::Char('q') => break,
            Key::Char(c) => write!(stdout, "You pressed: {}\r\n", c).unwrap(),
            _ => {}
        }
        stdout.flush().unwrap();
    }
}
```

#### Colors and cursor positioning:

```rust
use termion::{color, cursor, clear};

println!("{}{}Hello in red{}", cursor::Goto(1, 1), color::Fg(color::Red), color::Fg(color::Reset));
println!("{}", clear::All);
```

⚠️ Unix-only — no Windows support, since it talks to termios directly. That's exactly why `crossterm` (cross-platform) is the more common pick for anything that needs to run on Windows too, and why bigger TUI frameworks like `ratatui` default to a `crossterm` backend these days.

✅ Still fine for a quick Linux/macOS-only tool where you don't want a heavier dependency tree.
