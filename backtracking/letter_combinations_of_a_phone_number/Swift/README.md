# Letter Combinations of a Phone Number — Swift

Solutions ordered from most to least efficient. All three run in O(n·4^n) time, so the ranking is decided by extra memory and per-character work.

## 1. ⭐ Backtracking — `1_backtracking.swift`

Think of the answer as a tree. The first digit picks one of its letters, the second digit picks one of its letters, and so on. Walk the tree depth-first while keeping one shared path of letters. When the path is as long as the input, copy it into the result, then step back and try the next letter. Only the current path is stored, so no intermediate strings pile up in memory.

- Time: O(n·4^n), where n is the number of digits. There are at most 4^n combinations (4 letters per digit at worst), and each one takes O(n) to build.
- Space: O(n) for the recursion depth and the shared path, not counting the output

## 2. Mixed-Radix Counting — `2_mixed_radix.swift`

Every combination has a number. For the digits 2, 3, 7 there are 3 · 3 · 4 = 36 combinations, and each number from 0 to 35 picks exactly one of them. Read that number like a mixed-base number, where the last digit changes fastest. Repeatedly take `k % letters` and `k / letters` to choose each letter. There is no recursion and no queue, but each combination is rebuilt from scratch, so it does a little more work per character than backtracking.

- Time: O(n·4^n), with n divide-and-mod steps for each combination
- Space: O(n) for the temporary character buffer, not counting the output

## 3. Iterative Expansion — `3_iterative_expansion.swift`

Start with a list that holds only the empty string. For each digit, build a new list by appending each of that digit's letters to every string in the current list. After the last digit, the list holds every combination. This is the same tree as backtracking, explored one full level at a time (breadth-first). It is often quick in practice, but it keeps every intermediate level in memory, so it ranks last.

- Time: O(n·4^n)
- Space: O(n·4^n), because every intermediate level is stored and the final level is the output
