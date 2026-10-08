# Daily Temperatures — Swift

Solutions ordered from most to least efficient.

## 1. ⭐ Monotonic Stack — `1_monotonic_stack.swift`

Walk through the days left to right, keeping a stack of days that are still
waiting for a warmer one. Because each new day either gets pushed on top or
pops the days below it, the temperatures on the stack always run from warmest
at the bottom to coolest at the top. When today's temperature beats the day on
top, that day has just found its answer: pop it and record the gap in days.
Keep popping while today is still warmer, then push today so it can wait for
its own warmer day. Every index is pushed once and popped at most once, so the
whole thing is linear.

- Time: O(n)
- Space: O(n) for the stack

## 2. Backward Scan — `2_backward_scan.swift`

Fill the answers from the last day backwards, so when you reach a day the
answers for every later day are already known. Look at tomorrow: if it's
warmer, you're done. If not, you don't need to check the days in between
tomorrow and tomorrow's own warmer day, because they're all no warmer than
tomorrow — so jump straight there using tomorrow's answer, and repeat. If you
land on a day whose answer is 0, no warmer day ever comes. Each jump skips a
whole block of already-answered days, which keeps the total work linear. This
is the same big-O as the stack and uses no extra memory beyond the output,
but the jumping is harder to see at a glance, so the stack stays first.

- Time: O(n) amortized
- Space: O(1) extra beyond the output array

## 3. Brute Force — `3_bruteforce.swift`

For each day, scan forward one day at a time until you hit a warmer
temperature, then record how far you had to go. If you reach the end without
finding one, leave the answer at 0. Simple, but a long cooling stretch makes
every day re-scan the same days over and over.

- Time: O(n²)
- Space: O(1)
