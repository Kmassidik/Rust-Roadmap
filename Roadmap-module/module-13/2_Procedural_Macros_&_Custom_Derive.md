Procedural macros operate on token streams via code, not pattern-matching — three kinds: function-like, derive, attribute.

⚠️ They must live in their own crate with `proc-macro = true`:

```toml
# Cargo.toml
[lib]
proc-macro = true

[dependencies]
syn = "2"
quote = "1"
proc-macro2 = "1"
```

- `syn` — parses the token stream into a syntax tree
- `quote` — turns a syntax tree back into tokens (writes Rust code as if it were a template)

#### Custom derive — the most common kind (`#[derive(MyTrait)]`):

```rust
use proc_macro::TokenStream;
use quote::quote;
use syn::{parse_macro_input, DeriveInput};

#[proc_macro_derive(Describe)]
pub fn describe_derive(input: TokenStream) -> TokenStream {
    let ast = parse_macro_input!(input as DeriveInput);
    let name = ast.ident;

    let expanded = quote! {
        impl #name {
            fn describe() -> &'static str {
                stringify!(#name)
            }
        }
    };

    TokenStream::from(expanded)
}
```

Usage from the consuming crate:

```rust
#[derive(Describe)]
struct User;

fn main() {
    println!("{}", User::describe());   // output → User
}
```

#### Function-like — looks like a macro call, e.g. `sql!(SELECT * FROM users)`:

```rust
#[proc_macro]
pub fn my_macro(input: TokenStream) -> TokenStream {
    input   // just echoes tokens back, real ones parse/transform
}
```

#### Attribute — custom `#[my_attr]` annotations, e.g. how `#[tokio::main]` works:

```rust
#[proc_macro_attribute]
pub fn my_attr(_attr: TokenStream, item: TokenStream) -> TokenStream {
    item
}
```

✅ Use derive macros for boilerplate trait impls (`serde::Serialize`, `Debug`-like traits). Reach for `macro_rules!` first — proc macros are heavier to write and compile slower.
