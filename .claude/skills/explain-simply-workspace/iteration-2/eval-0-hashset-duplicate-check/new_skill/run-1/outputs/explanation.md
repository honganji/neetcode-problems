## What this code is doing

This function checks whether an array has any duplicate numbers in it, and it does that using a **hash set** — a collection that stores unique values and can tell you "have I seen this before?" in constant time, meaning the check takes roughly the same amount of time no matter how big the set gets.

## Walking through it

```swift
func containsDuplicate(_ nums: [Int]) -> Bool {
    var seen = Set<Int>()
    for num in nums {
        if !seen.insert(num).inserted {
            return true
        }
    }
    return false
}
```

- `var seen = Set<Int>()` creates an empty set called `seen`. Think of a set as an array that refuses to hold duplicates and doesn't care about order — its whole job is "track which values exist."
- The `for num in nums` loop walks through every number in the input array, one at a time.
- The interesting part is `seen.insert(num).inserted`. In Swift, calling `.insert()` on a set does two things at once: it tries to add the value, and it hands back a result telling you whether that value was actually new. That result is a small bundle with an `.inserted` field — `true` if the value wasn't already there (so it just got added), `false` if the value was already in the set (so nothing changed).
- The `!` in front flips that boolean, so `!seen.insert(num).inserted` reads as "this number was *not* newly inserted" — in other words, "I've already seen this number before." When that's true, the function immediately returns `true`, meaning a duplicate was found.
- If the loop finishes without ever hitting that condition, it means every number was unique, so the function returns `false`.

The clever bit here is doing the "check if it's there" and "add it" as a single atomic step, rather than writing it as two separate operations like `if seen.contains(num) { return true }` followed by `seen.insert(num)`. Both approaches give the same answer, but combining them into one `insert` call avoids redundant work — you're not searching the set twice for the same value.

## Why it matters

A hash set looks up and inserts values in O(1) time on average, meaning each operation costs a roughly constant amount of work regardless of how many items are already stored. Since the loop runs once per element in `nums`, the whole function runs in O(n) time — one pass through the array, with cheap work at each step. Compare that to a naive approach that compares every pair of numbers to check for duplicates, which costs O(n²) — the hash set trades a bit of extra memory (it has to store the numbers it's seen) for a massive speedup on large inputs.

## One thing worth remembering

When you need to repeatedly ask "have I seen this value before?", reach for a set (or a hash map if you need to track more than just presence, like a count) instead of scanning through a list each time — it's one of the most common and effective trade-offs in programming: spend a little extra memory to save a lot of repeated search time.
