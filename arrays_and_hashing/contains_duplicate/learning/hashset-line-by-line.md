# Line-by-line: Python `1_hashset.py`

```python
def contains_duplicate(nums: list[int]) -> bool:
    seen = set()
    for num in nums:
        if num in seen:
            return True
        seen.add(num)
    return False
```

- `def contains_duplicate(nums: list[int]) -> bool:` — defines the function,
  taking a list of ints and returning a bool. The type hints are just
  documentation — Python doesn't enforce them at runtime.
- `seen = set()` — creates an empty set to track numbers already encountered.
  A set gives O(1) average-case membership checks (`in`) and insertions, unlike
  a list which would need O(n) to check membership.
- `for num in nums:` — iterates through the array once, left to right.
- `if num in seen: return True` — before adding the current number, check
  whether it's already in `seen`. If it is, this exact value showed up earlier
  in the array — a duplicate — so return `True` immediately without scanning
  the rest.
- `seen.add(num)` — only reached if `num` wasn't already seen. Add it to the
  set so future iterations can detect it as a duplicate.
- `return False` — if the loop finishes without ever hitting the early return,
  no value repeated.

**Why it's O(n)/O(n):** each element is visited once, and each `in`/`add`
operation on a set is O(1) on average, so total time is linear; space is O(n)
in the worst case (all elements unique, all stored in `seen`).
