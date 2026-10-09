# Binary Search — Dart

Solutions ordered from most to least efficient.

## 1. ⭐ Iterative Binary Search — `1_iterative.dart`

Because the array is sorted, one comparison with the middle element tells you
which half the target must be in. Keep two markers, `low` and `high`, for the
range still worth searching. Look at the middle: if it's the target, you're
done; if it's smaller than the target, everything to its left is too small, so
move `low` past it; otherwise move `high` before it. Each step throws away
half of what's left, so even a million elements take only about twenty steps.
The middle is computed as `low + (high - low) / 2` rather than
`(low + high) / 2` so the sum can never overflow in languages with fixed-size
integers.

- Time: O(log n)
- Space: O(1)

## 2. Recursive Binary Search — `2_recursive.dart`

Same halving idea, written as a function that calls itself on the half that
could still hold the target. The base case is an empty range (`low > high`),
which means the target isn't there. Each call shrinks the range by half, so
the recursion is only about log n levels deep. It reads naturally, but every
level sits on the call stack, so it costs a little extra memory compared to
the loop.

- Time: O(log n)
- Space: O(log n) for the recursion stack

## 3. Linear Scan — `3_linear_scan.dart`

Walk the array from the front and stop as soon as you see the target. Since
the array is sorted, you can also give up early the moment you pass a value
larger than the target. This ignores most of what sorting gives you, so it is
far slower on big inputs, but it is the baseline the halving approaches are
measured against.

- Time: O(n)
- Space: O(1)
