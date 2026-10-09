# Target Sum — Dart

Solutions ordered from most to least efficient.

## 1. ⭐ Subset-Sum DP — `1_subset_sum_dp.dart`

Split the numbers into a group that gets `+` and a group that gets `-`. If the `+` group adds up to `P`, the total is `P - (sum - P)`, so `P` must equal `(sum + target) / 2`. That turns the question into "how many subsets add up to this goal?", which a table solves. `ways[s]` counts the subsets that sum to `s`. Each number updates the table from high to low so it is only used once. If the goal isn't a whole number, or the target is out of reach, the answer is 0.

- Time: O(N · S), where N is the number of values and S is their sum (S ≤ 1000 here)
- Space: O(S)

## 2. Meet in the Middle — `2_meet_in_the_middle.dart`

Split the list into two halves. List every signed sum of the left half and count how often each value appears. Then, for every signed sum of the right half, the left half must produce `target - that sum`, so look that value up in the counts and add it up. This avoids trying all 2^N sign patterns one by one. It is a good idea when the sums are large, but for this problem's limits the DP above is faster.

- Time: O(2^(N/2))
- Space: O(2^(N/2)) for the lists and counts

## 3. Backtracking — `3_backtracking.dart`

Go through the numbers in order. For each one, try adding it and then try subtracting it, and follow both paths. When every number has a sign, check whether the running total equals the target. If it does, that path counts as one way. This checks every sign pattern, so it is easy to write but slow for longer lists.

- Time: O(2^N)
- Space: O(N) for the recursion depth
