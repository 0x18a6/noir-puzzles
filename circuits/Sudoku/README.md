# Suduko puzzle writeup

![](../../sticker.webp)

Constraints to assert are:

- Sum of each row/column should be 10:

```rust
  assert(10 == answer[0] + answer[1] + answer[2] + answer[3]);
  assert(10 == answer[4] + answer[5] + answer[6] + answer[7]);
  assert(10 == answer[8] + answer[9] + answer[10] + answer[11]);
  assert(10 == answer[12] + answer[13] + answer[14] + answer[15]);
```

- There should be no repetition in numbers for any row/column:

```rust
 for row in 0..4 {
        let mut arr: [Field; 4]  = [0; 4];
        for i in 0..4 {
            arr[answer[row * 4 + i] - 1] += 1;
        }

        for i in 0..4 {
            assert(arr[i] == 1);
        }
    }
```

## Testing

`main` function signature is `main(question: pub [Field; 16], answer: [Field; 16])`, a `bool` must be returned for the tests to pass though:

```rust
  #[test]
  fn test_correct_solution() {
    // ...
    assert(main(question, answer) == true); // the returned bool will be used here
  }
```

Therefore `main` should look like this for testing:

```rust
fn main(question: pub [Field; 16], answer: [Field; 16]) -> pub bool {
  // ...

  bool // returns bool
}
```

[The thing with Noir](https://noir-lang.org/docs/dev/how_to/how-to-solidity-verifier/#step-4---verifying) is that:

> A circuit doesn't have the concept of a return value. Return values are just "syntactic sugar 💅"
>
> Under the hood, the return value is passed as an input to the circuit and is checked at the end of the circuit program.

Therefore when trying to run `forge test`, you will get the following error:

```
Failing tests:
Encountered 1 failing test in test/Sudoku.t.sol:Noir
[FAIL. Reason: PUBLIC_INPUT_COUNT_INVALID(17, 16)] test_correct_solution()
```

This is because the boolean is passed as an input to the circuit as well!

## Generate the verifer: `nargo codegen-verifier`

```
[Suduko] Contract successfully created and located at ~/noir-puzzles/circuits/Sudoku/circuits/contract/Suduko/plonk_vk.sol`
```

## Prove the solution: `nargo prove`

But what is the prover trying to prove exactly here anon?

The prover is proving that he **knows at least one solution to a suduko in particular setup** without revealing his solution.

## Verify the solution: `nargo verify`

The verification will complete in silence if it is successful.
