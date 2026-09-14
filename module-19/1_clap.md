#### The standard for CLI argument parsing — derive-based, builds `--help`/`-h` for you:

```rust
use clap::Parser;

#[derive(Parser)]
#[command(name = "mytool", version, about = "A tiny CLI tool")]
struct Args {
    /// Name to greet
    name: String,

    #[arg(short, long, default_value_t = 1)]
    count: u32,

    #[arg(short, long)]
    verbose: bool,
}

fn main() {
    let args = Args::parse();

    for _ in 0..args.count {
        println!("Hello, {}!", args.name);
    }

    if args.verbose {
        println!("(verbose mode on)");
    }
}
```

```bash
cargo run -- Kurnia --count 3 --verbose
```

#### Subcommands via an enum:

```rust
use clap::{Parser, Subcommand};

#[derive(Parser)]
struct Cli {
    #[command(subcommand)]
    command: Commands,
}

#[derive(Subcommand)]
enum Commands {
    Add { a: i32, b: i32 },
    Greet { name: String },
}

fn main() {
    let cli = Cli::parse();

    match cli.command {
        Commands::Add { a, b } => println!("{}", a + b),
        Commands::Greet { name } => println!("Hello, {name}!"),
    }
}
```

```bash
cargo run -- add 2 3
cargo run -- greet Kurnia
```

✅ This is the de facto choice for Rust CLIs as of 2026 — actively maintained, and `structopt`'s job got folded into it (see next file).
