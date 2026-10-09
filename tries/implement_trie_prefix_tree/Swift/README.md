# Implement Trie (Prefix Tree) — Swift

Solutions ordered from most to least efficient.

The helper node is a nested `final class Node` inside `Trie` for solutions 1 and 2.

## 1. ⭐ Array Children — `1_array_children.swift`

A trie is a tree where each edge is one letter, so every path from the root
spells a prefix. Each node keeps a fixed array of 26 child slots (one per
lowercase letter) plus a flag saying "a word ends here." Inserting walks the
letters of the word, creating missing nodes along the way, then sets the flag
on the last node. `search` and `startsWith` walk the same path; the only
difference is that `search` also requires the end flag. Because a letter maps
straight to an array index, each step is a direct lookup with no hashing,
which makes this the fastest variant.

- Time: O(L) per operation, where L is the length of the word or prefix
- Space: O(N · 26), where N is the total number of characters inserted (each node always reserves 26 slots)

## 2. Hash Map Children — `2_hashmap_children.swift`

The same tree, but each node stores its children in a map from letter to node
instead of a 26-slot array. The walk through insert, search and startsWith is
identical. Nodes with only one or two children no longer pay for 24 empty
slots, so sparse tries use noticeably less memory. The trade-off is that each
step is a hash lookup rather than an array index, so lookups are a little
slower in practice; the asymptotic complexity is the same as the array version.

- Time: O(L) per operation
- Space: O(N), proportional to the characters actually stored

## 3. Hash Set of Words and Prefixes — `3_hashset_of_words_and_prefixes.swift`

Skip the tree entirely: keep one set of complete words and one set of every
prefix ever seen. On insert, add the word to the first set and each of its
prefixes (`a`, `ap`, `app`, ...) to the second. `search` and `startsWith`
then become single set lookups. It is easy to write and the queries are quick,
but insert builds L prefix strings of growing length, so it costs O(L²) time
and the prefix set can hold O(L²) characters per word, which is why this ranks
last.

- Time: O(L²) for insert; O(L) for search and startsWith (hashing the string)
- Space: O(sum of L²) across all inserted words
