# Design Add and Search Words Data Structure — Kotlin

Solutions ordered from most to least efficient.

## 1. ⭐ Trie DFS — `1_trie_dfs.kt`

Store every word in a trie: a tree where each node has 26 slots, one per
letter, and a flag saying "a word ends here". Adding a word walks down the
tree, creating nodes as needed. Searching walks the same way, except that a
`.` cannot pick a single slot, so the recursion tries every child that exists
and succeeds if any branch reaches the end of the query on a node flagged as a
word. Shared prefixes are stored once, and a plain query touches exactly one
node per character. The helper `Node` class is nested as a private class inside `WordDictionary` in the same file.

- Time: O(L) for addWord and for a search without dots; O(26^d · L) worst case
  for a search with d dots (d ≤ 2 under the constraints)
- Space: O(total characters · 26) for the trie nodes

## 2. Trie Iterative — `2_trie_iterative_bfs.kt`

Same trie, but the search keeps an explicit stack of (node, index) pairs
instead of recursing. Each popped pair either finishes the query (and checks
the word flag) or pushes the matching child, or every child when the current
character is a dot. It visits the same nodes in the same amount of work as the
recursive version and ties with it on complexity; it is listed second only
because the recursive form is shorter and easier to read. The helper `Node` class is nested as a private class inside `WordDictionary` in the same file.

- Time: O(L) without dots; O(26^d · L) worst case with d dots
- Space: O(total characters · 26) for the trie, plus the explicit stack

## 3. Length Buckets — `3_length_buckets.kt`

Skip the trie and group stored words by length. A query can only match words
of the same length, so the search pulls that one bucket and compares each word
character by character, letting `.` match anything. It is simple and stores
only the raw strings, but every search scans the whole bucket, so it slows
down linearly as more words of that length are added.

- Time: O(1) for addWord; O(N · L) per search, where N is the number of stored
  words of that length
- Space: O(total characters)
