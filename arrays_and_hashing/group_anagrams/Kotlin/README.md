# Group Anagrams — Kotlin

Solutions ordered from most to least efficient.

## 1. ⭐ Character-Count Key — `1_count_key.kt`

Two words are anagrams exactly when each letter shows up the same number of
times in both. So count the 26 letters of each word and use that count as the
word's "fingerprint." Every anagram of a word produces the same fingerprint,
so a map from fingerprint to list of words naturally sorts the input into
groups. Counting is a single pass over each word, so no sorting is needed.

- Time: O(n·k), where n is the number of words and k is the longest word
- Space: O(n·k) for the map holding every word plus a 26-slot key per group

## 2. Sorted-String Key — `2_sorted_key.kt`

Anagrams contain the same letters, so once you sort a word's letters every
anagram of it turns into the same string. Use that sorted string as the map
key and append each original word to its key's list. It's a simpler key to
build than the count array but costs a sort per word.

- Time: O(n·k log k)
- Space: O(n·k) for the map plus the sorted copies

## 3. Brute Force — `3_bruteforce.kt`

Skip the map entirely: take each word that hasn't been placed yet, start a new
group with it, then scan every later word and pull in the ones with matching
letter counts, marking them as placed. Each comparison is cheap (26 counters),
but every word may be compared against every other word.

- Time: O(n²·k)
- Space: O(n·k) for the precomputed count arrays and the visited flags
