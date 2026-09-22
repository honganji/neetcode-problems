# Why Python sometimes has `:` and sometimes doesn't

Colons show up for two unrelated reasons:

## 1. Starting an indented block

Required after `def`, `for`, `if`, `while`, `class`, etc.:

```python
def contains_duplicate(nums: list[int]) -> bool:   # colon: block starts (function body)
    for num in nums:                                 # colon: block starts (loop body)
        if num in seen:                              # colon: block starts (if body)
```

Python uses indentation instead of `{}`, and the colon signals "the block
begins here." This colon is mandatory syntax.

## 2. Type annotations

Optional, purely documentation — not enforced at runtime:

```python
nums: list[int]
```

Here the colon means "this parameter/variable is annotated with this type."

## Putting it together

- `def ...():` — colon is required syntax for the block.
- `nums: list[int]` — colon is optional, only appears when a type hint is added.
- `seen = set()` — no colon, since there's no type hint and it's not a
  block-opening statement.
