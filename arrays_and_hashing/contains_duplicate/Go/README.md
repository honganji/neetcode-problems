# Contains Duplicate — Go

Solutions ordered from most to least efficient.

## 1. ⭐ Hash Set — `1_hashset.go`

Walk through the array once, adding each number to a map (used as a set) as you
go. A map gives O(1) average lookups, so if a number is already a key when you
try to add it, you've found a repeat — return `true` right away. If you make it
through the whole array without that happening, every value was unique.

- Time: O(n)
- Space: O(n)

## 2. Sorting — `2_sorting.go`

Sort a copy of the array first — this pushes any duplicate values right next to
each other. Then scan through once, comparing each element to its neighbor: if
two adjacent elements are equal, there's a duplicate.

- Time: O(n log n)
- Space: O(n) for the sorted copy (O(1) extra if sorting the input slice in
  place is acceptable)

## 3. Brute Force — `3_bruteforce.go`

Compare every pair of elements in the array. If any two match, return `true`
right away. If no pair matches after checking them all, the array has no
duplicates.

- Time: O(n²)
- Space: O(1)
