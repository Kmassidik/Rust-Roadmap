#### GDB wrapper bundled with rustup — pretty-prints Rust types (enums, `Vec`, `String`, `Option`) instead of raw struct bytes:

```bash
rustc -g src/main.rs -o myapp   # -g keeps debug symbols (cargo build does this by default in debug mode)
rust-gdb ./target/debug/myapp
```

#### Common commands once inside:

```gdb
break main              # set a breakpoint at main
break src/main.rs:12    # breakpoint at a specific line
run                     # start the program
next                    # step over (n)
step                    # step into (s)
print my_var            # inspect a variable (p)
backtrace               # show the call stack (bt)
continue                # resume until next breakpoint (c)
quit                    # exit gdb (q)
```

⚠️ Debug info only exists in **debug builds** — `cargo build --release` strips it by default, so `rust-gdb` on a release binary gives you garbage/no source lines.

Linux-only in practice — macOS ships without a working system GDB, use `rust-lldb` there instead.
