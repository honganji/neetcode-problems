class Solution {
    fun ladderLength(beginWord: String, endWord: String, wordList: List<String>): Int {
        val words = (wordList.toSet() + beginWord).toList()
        val index = words.withIndex().associate { (i, w) -> w to i }
        val end = index[endWord] ?: return 0
        val start = index.getValue(beginWord)

        // Build the full graph: connect every pair of words that differ by one letter.
        val graph = List(words.size) { mutableListOf<Int>() }
        for (i in words.indices) {
            for (j in i + 1 until words.size) {
                if (oneLetterApart(words[i], words[j])) {
                    graph[i].add(j)
                    graph[j].add(i)
                }
            }
        }

        // Plain BFS on the explicit graph.
        val dist = IntArray(words.size) // 0 = unvisited
        dist[start] = 1
        val queue = ArrayDeque<Int>()
        queue.add(start)
        while (queue.isNotEmpty()) {
            val node = queue.removeFirst()
            if (node == end) return dist[node]
            for (next in graph[node]) {
                if (dist[next] == 0) {
                    dist[next] = dist[node] + 1
                    queue.add(next)
                }
            }
        }
        return 0
    }

    private fun oneLetterApart(a: String, b: String): Boolean =
        a.indices.count { a[it] != b[it] } == 1
}
