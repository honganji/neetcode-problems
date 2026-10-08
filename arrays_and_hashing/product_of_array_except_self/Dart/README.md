# Product of Array Except Self — Dart

Solutions ordered from most to least efficient.

The obvious trick — multiply everything together and divide by each element —
is ruled out by the problem statement (and breaks on zeros anyway), so every
approach below builds each answer from the elements on either side instead.

## 1. ⭐ Prefix/Suffix In Place — `1_prefix_suffix_inplace.dart`

The product of everything except position `i` is just (product of everything
to the left of `i`) × (product of everything to the right of `i`). First
sweep left to right, storing in the output array the running product of all
elements before each index. Then sweep right to left with a single running
variable holding the product of all elements after the current index, and
multiply it into the slot you already filled. Each slot ends up with left ×
right, and the output array doubles as the only scratch space.

- Time: O(n)
- Space: O(1) extra (the output array is not counted)

## 2. Prefix and Suffix Arrays — `2_prefix_suffix_arrays.dart`

Same idea, but spelled out with two helper arrays: `prefix[i]` is the product
of everything before `i`, and `suffix[i]` is the product of everything after
`i`. Build each one with a single pass in its own direction, then the answer
at every index is simply `prefix[i] * suffix[i]`. It's easier to follow than
the in-place version, at the cost of two extra arrays.

- Time: O(n)
- Space: O(n) for the two helper arrays

## 3. Brute Force — `3_bruteforce.dart`

For each index, loop over the whole array and multiply together every element
whose index is different. This directly mirrors the problem statement, but it
redoes almost all of the same multiplications for every position, so it gets
slow fast on large inputs.

- Time: O(n²)
- Space: O(1) extra
