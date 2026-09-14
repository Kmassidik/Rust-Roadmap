⚠️ Embedded Rust usually runs `#![no_std]` — no heap by default, no standard library, since there's no OS underneath. Keep that in mind for everything below.

#### embedded-hal — the trait *interface*, not a runtime:

```rust
#![no_std]
use embedded_hal::digital::OutputPin;

fn blink<P: OutputPin>(pin: &mut P) {
    pin.set_high().ok();
}
```

This is just a shared set of traits (`OutputPin`, `SpiBus`, `I2c`, ...) so drivers can be written once and work across any chip whose HAL implements them. It does nothing by itself — you always pair it with a chip-specific HAL crate.

---

#### rppal — Raspberry Pi GPIO/peripheral access:

```rust
use rppal::gpio::Gpio;

let gpio = Gpio::new()?;
let mut pin = gpio.get(18)?.into_output();
pin.set_high();
```

Runs on full Linux (the Pi's OS), so this one is NOT `no_std` — you get the standard library, just with GPIO/I2C/SPI/PWM access bolted on.

---

#### nrf-hal — Nordic nRF microcontroller family HAL:

- Implements `embedded-hal`'s traits for Nordic's nRF52/nRF91 chips (common in BLE devices)
- True `no_std` bare-metal target — this is the "real" embedded case, no OS at all
