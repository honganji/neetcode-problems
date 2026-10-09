# Time Based Key-Value Store — Python

Solutions ordered from most to least efficient.

## 1. ⭐ Binary Search — `1_binary_search.py`

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

## 2. Library-Backed Search — `2_builtin_search.py`

Same idea and same storage, but hand the search to the standard library.
Timestamps and values live in two parallel lists per key, and
`bisect.bisect_right` finds the position just after the last timestamp that is
less than or equal to the query. One step back from that position is the
answer; a position of zero means every stored timestamp is too late. This is
the same algorithm as the hand-written version, just shorter and harder to get
wrong.

- Time: O(1) for set, O(log n) for get
- Space: O(n) for the stored entries

## 3. Linear Scan — `3_linear_scan.py`

Store entries the same way, but answer `get` by walking the key's list from
the newest entry backwards and stopping at the first timestamp that is not too
late. Because the list is sorted, the first match from the end is the correct
one. It is simple and correct, but a lookup may have to visit every entry for
that key, which is far slower than binary search once a key has many writes.

- Time: O(1) for set, O(n) for get
- Space: O(n) for the stored entries
