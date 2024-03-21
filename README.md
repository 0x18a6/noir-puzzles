# Noir Puzzles

Solution for Noir Puzzles.

![noir](sticker.webp)

## Debugging

### `PUBLIC_INPUT_COUNT_INVALID(x, y)`:

A circuit doesn't have the concept of a return value. Return values are just syntactic sugar ✨ in Noir.
Under the hood, the return value is passed as an input to the circuit and is checked at the end of the circuit program.

For example, if you have Noir program like this:

```rust
fn main(
    // Public inputs
    pubkey_x: pub Field,
    pubkey_y: pub Field,
    // Private inputs
    priv_key: Field,
) -> pub Field
```

The `verify()` function will expect the public inputs array (second function parameter) to be of length 3, the two inputs and the return value. Like before, these values are populated in Verifier.toml after running `nargo prove`.

Passing only two inputs will result in an error such as `PUBLIC_INPUT_COUNT_INVALID(3, 2)`.

In this case, the inputs parameter to `verify` would be an array ordered as `[pubkey_x, pubkey_y, return]`.

## Helpful Links

- [Generate a Solidity Verifier](https://noir-lang.org/docs/dev/how_to/how-to-solidity-verifier/#step-4---verifying)
