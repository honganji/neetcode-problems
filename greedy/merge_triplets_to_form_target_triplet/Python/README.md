# Merge Triplets to Form Target Triplet — Python

Solutions ordered from most to least efficient. Only two genuinely different techniques exist for this problem, so there are two solutions.

## 1. ⭐ Greedy Max Merge — `1_greedy.py`

Merging can only raise numbers, so any triplet with a value bigger than the target's matching value can never be used. Skip those. Then merge all the rest by taking the max in each position. Adding a useful triplet never hurts, so this running max is the largest each position can reach. If it matches the target in all three positions, the answer is yes.

- Time: O(n)
- Space: O(1)

## 2. Brute Force Over Witness Triples — `2_bruteforce.py`

Any successful merge can be explained by at most three triplets: one that supplies the `x`, one that supplies the `y`, and one that supplies the `z`. So try every choice of three indices (repeats allowed, which also covers the case where one triplet already equals the target). For each choice, take the max of each position and check it against the target. This works without the greedy insight, but it is slow.

- Time: O(n³)
- Space: O(1)
