# Single Number — Dart

Solutions ordered from most to least efficient.

## 1. ⭐ XOR cancellation — `1_xor.dart`

XOR (`^`) has two useful rules: `a ^ a == 0` (a number XOR itself is zero) and `a ^ 0 == a`. Every value that appears twice cancels out, no matter where its two copies are, so XOR-ing the whole list leaves only the single number.

- Time: O(n)
- Space: O(1)

## 2. HashSet toggle — `2_hashset.dart`

Keep a set of the numbers seen so far. When a number shows up again, remove it, because its pair is now complete. Whatever is left in the set at the end is the single number.

- Time: O(n)
- Space: O(n)

## 3. Sorting — `3_sorting.dart`

Sort a copy so equal numbers sit next to each other. Step through the list two at a time: the first pair that does not match gives the answer. If every pair matches, the single number is the last element.

- Time: O(n log n)
- Space: O(n) for the sorted copy
