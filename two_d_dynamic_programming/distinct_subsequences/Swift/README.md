# Distinct Subsequences — Swift

Solutions ordered from most to least efficient. Only two genuinely different techniques exist for this problem, so there are two solutions.

## 1. ⭐ Prefix DP with a Single Array — `1_dp.swift`

Keep `ways[j]`: the number of ways the first `j` characters of `t` can be picked out of the part of `s` read so far. Start with `ways[0] = 1`, since the empty prefix can always be formed in one way. When you read a character `ch` from `s`, every way to form `t[0..<j-1]` can be extended by `ch` if `t[j-1] == ch`, so add `ways[j-1]` to `ways[j]`. Looping `j` from the end down to 1 makes sure the same character of `s` is never used twice in one step. The answer is `ways[m]`.

- Time: O(n · m), where n = `s.count` and m = `t.count` (in bytes)
- Space: O(m)

## 2. Bitmask Brute Force — `2_bitmask.swift`

Every number from 0 to 2^n − 1 is a choice of positions in `s`: bit `i` set means keep `s[i]`. Build the kept bytes for each choice and count the ones equal to `t`. It is easy to trust because it checks every case directly, but the number of choices doubles with each character, so it only works for very short `s` (around 20 characters).

- Time: O(2^n · n)
- Space: O(n)
