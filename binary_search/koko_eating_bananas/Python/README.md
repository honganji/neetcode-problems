# Koko Eating Bananas — Python

Solutions ordered from most to least efficient.

## 1. ⭐ Binary Search on the Answer — `1_binary_search.py`

Checking whether a given speed `k` works is easy: each pile takes
`ceil(pile / k)` hours, so add those up and compare to `h`. The key
observation is that faster speeds never hurt — if `k` finishes in time, so
does every speed above it. That makes the speeds a sorted "no, no, no, yes,
yes" sequence, which binary search handles perfectly. Search between 1 and the
largest pile (eating any faster than that is pointless), and shrink toward the
first speed that passes the check.

- Time: O(n log m), where m is the largest pile
- Space: O(1)

## 2. Binary Search with Tighter Bounds — `2_binary_search_tight_bounds.py`

Same idea as #1, but start the search from a smarter floor. Koko has to eat
`sum(piles)` bananas in at most `h` hours, so any speed below
`ceil(sum / h)` can't possibly be enough — even if every hour were used at
full speed. Starting the low end there trims a few iterations off the search
without changing the logic. It's a refinement of #1 rather than a different
algorithm: the worst-case complexity is identical.

- Time: O(n log m), where m is the largest pile
- Space: O(1)

## 3. Linear Scan — `3_linear_scan.py`

Try speed 1, then 2, then 3, and so on, running the same hours check each
time. The first speed that finishes within `h` hours is the answer, and it's
guaranteed to be minimal because every smaller speed was already tried and
failed. Simple and obviously correct, but it can take up to a billion attempts
when the piles are huge.

- Time: O(n · m), where m is the largest pile
- Space: O(1)
