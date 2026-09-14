A DSL is a mini "language" embedded in Rust syntax via macros — built with `macro_rules!` for simple cases, proc macros for anything needing real parsing.

#### A tiny state machine DSL:

```rust
macro_rules! state_machine {
    ($name:ident { $($state:ident => $next:ident),* $(,)? }) => {
        #[derive(Debug, PartialEq)]
        enum $name {
            $($state),*
        }

        impl $name {
            fn next(&self) -> $name {
                match self {
                    $(Self::$state => Self::$next),*
                }
            }
        }
    };
}

state_machine!(Light {
    Red => Green,
    Green => Yellow,
    Yellow => Red,
});

fn main() {
    let s = Light::Red;
    println!("{:?}", s.next());   // output → Green
}
```

#### An HTML-like builder DSL:

```rust
macro_rules! html {
    ($tag:ident { $($inner:tt)* }) => {
        format!("<{0}>{1}</{0}>", stringify!($tag), html!($($inner)*))
    };
    ($text:expr) => {
        $text.to_string()
    };
}

fn main() {
    let page = html!(div { "hello world" });
    println!("{}", page);   // output → <div>hello world</div>
}
```

- `$($inner:tt)*` — `tt` (token tree) captures arbitrary nested syntax, useful for DSLs that need to recurse into their own body
- real-world examples: `html!` in `maud`, `sql!`-style query builders, `clap`'s derive API

⚠️ When a `macro_rules!` DSL starts needing real control flow, loops, or non-trivial parsing to validate its grammar, that's the signal to move to a proc macro with `syn` instead of fighting token-tree matching.
