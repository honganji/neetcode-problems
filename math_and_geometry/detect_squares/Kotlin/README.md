# Detect Squares — Kotlin

Solutions ordered from most to least efficient.

## 1. ⭐ Try every side length — `1_side_length.kt`

Fix the query point as one corner. Any square that uses this corner is set by two things: how long its sides are (`d`), and which way it extends (up or down, left or right). That is only 4 directions for each `d`. So instead of searching the stored points, try every `d` from 1 to 1000 and every direction. For each one, the other three corners are known, so look them up in a count map and multiply the counts. Adding a point only bumps a count.

- Time: add O(1); count O(R), where R = 1000 is the largest coordinate (4 × 1000 lookups, a constant)
- Space: O(D), where D is the number of distinct points stored

## 2. Diagonal scan — `2_diagonal_scan.kt`

Walk through the stored points and treat each one as the corner diagonally opposite the query point. That only works if it sits on a true diagonal: the distance in x equals the distance in y, and neither is zero. If it does, the other two corners are `(qx, py)` and `(px, qy)`. Look them up and multiply with the count of the diagonal point. The work grows with the number of stored points, so it is slower when many points are added.

- Time: add O(1); count O(D), where D is the number of distinct points stored
- Space: O(D)

## 3. Brute-force list — `3_bruteforce.kt`

Same idea as #2, but without a count map. Keep a plain list of every point, including repeats. To check how many copies of a corner exist, scan the whole list. Each candidate costs two full scans, so a single `count` is quadratic in the number of points. It is the easiest to read and the slowest.

- Time: add O(1); count O(N²), where N is the total number of points added
- Space: O(N)
