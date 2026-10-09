# House Robber II — Python

Solutions ordered from most to least efficient.

## 1. ⭐ Two linear passes — `1_two_linear_passes.py`

The first and last houses are neighbours, so they can't both be robbed. That means we only need to handle two cases: skip the last house, or skip the first house. Each case is a straight line of houses, which is the regular House Robber problem. For a line, at each house we choose the better of "skip it" or "rob it and add the best from two houses back". Two variables are enough to remember those values as we move along.

- Time: O(n)
- Space: O(1)

## 2. Memoized recursion with state flags — `2_memoized_recursion.py`

Instead of splitting the circle, this walks through all the houses once and remembers two facts: whether the previous house was robbed (so we don't rob two in a row), and whether house 0 was robbed (so we don't rob the last house). The answer for each combination of house index and these flags is saved in a dictionary, so it is computed only once. It uses the same idea as the first solution, but in a top-down form that is closer to how the problem is described.

- Time: O(n)
- Space: O(n) for the memo and recursion stack

## 3. Brute force over all subsets — `3_brute_force.py`

Try every possible set of houses to rob. Each set is written as a bit mask, where bit `i` means "rob house `i`". A set is allowed only if no two neighbours on the circle are both robbed. Keep the largest total among the allowed sets. It is simple to reason about, but the number of sets doubles with every house, so it only works for very small inputs.

- Time: O(2^n · n)
- Space: O(1)
