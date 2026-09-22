# Contains Duplicate — Dart

Solutions ordered from most to least efficient.

## 1. ⭐ Hash Set — `1_hashset.dart`

Walk through the array once, adding each number to a set as you go. A set can't
hold duplicate values, so if a number is already in the set when you try to add
it, you've found a repeat — return `true` right away. If you make it through the
whole array without that happening, every value was unique.

- Time: O(n)
- Space: O(n)

## 2. Sorting — `2_sorting.dart`

Sort a copy of the array first — this pushes any duplicate values right next to
each other. Then scan through once, comparing each element to its neighbor: if
two adjacent elements are equal, there's a duplicate.

- Time: O(n log n)
- Space: O(n) for the sorted copy (O(1) extra if sorting the input array in
  place is acceptable)

## 3. Brute Force — `3_bruteforce.dart`

Compare every pair of elements in the array. If any two match, return `true`
right away. If no pair matches after checking them all, the array has no
duplicates.

- Time: O(n²)
- Space: O(1)
