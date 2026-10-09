# Maximum Product Subarray — Dart

Solutions ordered from most to least efficient.

## 1. ⭐ Running max and min (DP) — `1_dp_max_min.dart`

Multiplying by a negative number flips the sign, so the smallest (most negative) product so far can become the largest after the next negative number. So at each index we track both the biggest and the smallest product of subarrays ending there. For a new number `x`, the new biggest is the largest of `x`, `biggest * x`, and `smallest * x`, and the new smallest is the smallest of those three. Keep the best biggest seen overall.

- Time: O(n)
- Space: O(1)

## 2. Prefix and suffix products — `2_prefix_suffix.dart`

A zero makes any subarray that contains it equal to 0, so zeros split the array into blocks with no zeros. Inside such a block, the best subarray is either a prefix or a suffix of the block: if the block has an even number of negatives, the whole block wins; if odd, the best one drops everything up to the first negative from one end. So multiply from the left and from the right, record the largest running product, and reset a running product to 1 after it hits a zero.

- Time: O(n)
- Space: O(1)

## 3. Brute force — `3_brute_force.dart`

Try every subarray. Fix a start index, extend the end one element at a time while keeping a running product, and remember the largest product seen. It is easy to trust, but it checks about n² subarrays.

- Time: O(n²)
- Space: O(1)
