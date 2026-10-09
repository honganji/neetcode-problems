# Word Search II — Swift

Solutions ordered from most to least efficient.

The trie node class `Node` is nested inside `findWords` in each trie solution.

## 1. ⭐ Trie DFS with Pruning — `1_trie_dfs_with_pruning.swift`

Searching the board once per word repeats the same walks over and over, so
instead put every word into a trie and walk the board once, letting the trie
decide which neighbours are worth stepping into: a step is only taken if the
current trie node has a child for that letter. The full word is stored on its
terminal node, so hitting one means "collect this" with no string building, and
clearing it afterwards guarantees each word is reported once. The key speed-up
is pruning: once a node has no children left, nothing below it can ever match
again, so it is cut out of its parent. Dead branches of the trie disappear as
they are exhausted and are never explored a second time from another cell.

- Time: O(m·n·4·3^(L-1)) in the worst case, where L is the longest word, but far
  less in practice because pruning shrinks the trie as words are found
- Space: O(total characters in `words`) for the trie

## 2. Trie DFS without Pruning — `2_trie_dfs_no_pruning.swift`

Same trie-guided walk as above, but the trie is left untouched after a word is
found. A set collects the results so a word reached from several cells is still
reported once. It is the simpler version to write and has the same worst-case
bound, yet on adversarial inputs (a board full of the same letter and many
similar words) it keeps re-walking trie branches that have already given up all
their words, so it can be noticeably slower than the pruned version.

- Time: O(m·n·4·3^(L-1)) in the worst case
- Space: O(total characters in `words`) for the trie plus the result set

## 3. Per-Word Backtracking — `3_per_word_backtracking.swift`

Run the ordinary Word Search backtracking once for every distinct word: from
each cell, try to match the word letter by letter, marking cells as used along
the way and unmarking them on the way back. Words longer than the whole board
are skipped outright. It is correct and easy to follow, but every word pays the
full board search independently, so the total cost grows linearly with the
number of words and times out on LeetCode's large inputs.

- Time: O(W·m·n·4·3^(L-1)) for W distinct words
- Space: O(L) for the recursion stack
