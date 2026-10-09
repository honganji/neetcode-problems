# Maximum Subarray — Swift

Solutions ordered from most to least efficient.

## 1. ⭐ Kadane's Algorithm — `1_kadane.swift`

Walk through the array once, keeping track of the best sum of a subarray that
ends at the current number. At each step you either add the current number to
the running sum or start a new subarray from it, whichever is larger. A running
sum that has dropped below the current number is never worth keeping, so
restarting there is always the right call. Track the largest running sum you
have seen along the way.

- Time: O(n)
- Space: O(1)

## 2. Divide and Conquer — `2_divide_and_conquer.swift`

Split the array in half. The best subarray is either entirely in the left half,
entirely in the right half, or it crosses the middle. The first two cases are
solved by recursing on each half. For the crossing case, the best piece is the
best suffix of the left half joined with the best prefix of the right half, and
both can be found with one scan outward from the middle. Combine the three
answers and return the largest.

- Time: O(n log n)
- Space: O(log n) for the recursion stack

## 3. Brute Force — `3_bruteforce.swift`

Try every possible subarray. For each starting index, extend the end index one
step at a time and keep a running sum. Record the largest sum seen across all
of them.

- Time: O(n²)
- Space: O(1)
