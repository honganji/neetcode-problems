# Coin Change II

[LeetCode](https://leetcode.com/problems/coin-change-ii/)

Given coin denominations and an amount, count the number of combinations of coins (each coin usable any number of times, order ignored) that add up to the amount.

> Note: solutions 1 and 2 use the same recurrence, `ways(i, r) = ways(i+1, r) + ways(i, r - coins[i])`. Solution 1 fills it in bottom-up and solution 2 evaluates it top-down with memoization. Solution 3 is plain brute force. So the problem really has two underlying ideas (DP and brute force), and the top-down version is included as a distinct evaluation strategy rather than a third new algorithm.

## Languages

- [Dart](Dart/README.md)
- [Python](Python/README.md)
- [Swift](Swift/README.md)
- [Kotlin](Kotlin/README.md)
