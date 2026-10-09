# Time Based Key-Value Store — Kotlin

Solutions ordered from most to least efficient.

## 1. ⭐ Binary Search — `1_binary_search.kt`

The problem promises that timestamps for a given key only ever go up, so
appending each `set` to a per-key list keeps that list sorted for free. A
sorted list is exactly what binary search needs: on `get`, look at the middle
entry, and if its timestamp is small enough, remember its value and search the
right half for something later; otherwise search the left half. When the
search runs out, the last remembered value is the newest one that is not past
the requested time, and if nothing was ever remembered, no such value exists.

- Time: O(1) for set, O(log n) for get, where n is the number of entries for
  that key
- Space: O(n) for the stored entries

## 2. Library-Backed Search — `2_builtin_search.kt`

Same idea, but let the standard library do the ordering and the search. Each
key maps to a `java.util.TreeMap`, a balanced search tree keyed by timestamp.
`floorEntry` returns the entry with the greatest key less than or equal to the
query in logarithmic time, or `null` when none exists, which is exactly the
question `get` asks. This also keeps working even if timestamps were inserted
out of order, at the cost of a tree being heavier than a plain list.

- Time: O(1) for set, O(log n) for get
- Space: O(n) for the stored entries

## 3. Linear Scan — `3_linear_scan.kt`

Store entries the same way, but answer `get` by walking the key's list from
the newest entry backwards and stopping at the first timestamp that is not too
late. Because the list is sorted, the first match from the end is the correct
one. It is simple and correct, but a lookup may have to visit every entry for
that key, which is far slower than binary search once a key has many writes.

- Time: O(1) for set, O(n) for get
- Space: O(n) for the stored entries
