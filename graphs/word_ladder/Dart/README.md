# Word Ladder — Dart

Solutions ordered from most to least efficient.

Let M be the word length and N the number of words.

## 1. ⭐ Bidirectional BFS — `1_bidirectional_bfs.dart`

Searching from `beginWord` alone can spread out to a huge number of words before it reaches `endWord`. Instead, start one search from each end and grow whichever side is smaller. The two searches meet in the middle after visiting far fewer words. As soon as one side generates a word the other side has already reached, the answer is known.

- Time: O(M² · N)
- Space: O(M · N)

## 2. Wildcard BFS — `2_wildcard_bfs.dart`

Words that differ by one letter share a pattern where that letter is replaced by `*`. For example, `hot`, `dot`, and `lot` all match `*ot`. Group every word under its patterns once, then run a normal BFS. From each word, look up its patterns to get all its neighbors directly. Removing a pattern after its first use stops the same group from being scanned again.

- Time: O(M² · N)
- Space: O(M² · N)

## 3. Pairwise graph BFS — `3_pairwise_graph_bfs.dart`

The simplest idea: compare every pair of words and connect the ones that differ in exactly one letter. Then run a plain BFS on that graph. Building the graph is the slow part, because it checks every pair of words.

- Time: O(M · N²)
- Space: O(N²) in the worst case, for the edges
