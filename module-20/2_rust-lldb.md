#### Same idea as `rust-gdb`, but wraps LLDB — the debugger that actually works out of the box on macOS:

```bash
rust-lldb ./target/debug/myapp
```

#### Common commands (note the different syntax from gdb):

```lldb
b main                  # breakpoint at main
b src/main.rs:12        # breakpoint at a specific line
r                       # run
n                       # step over
s                       # step into
p my_var                # print a variable
bt                      # backtrace
c                       # continue
q                       # quit
```

✅ Use `rust-lldb` when:
- You're on macOS (no reliable system `gdb`)
- You're already inside an LLDB-based setup (Xcode, CLion's LLDB backend, VS Code's `CodeLLDB` extension)

Same debug-symbols caveat as gdb applies — build without `--release`.
