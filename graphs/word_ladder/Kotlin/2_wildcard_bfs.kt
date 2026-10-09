class Solution {
    fun ladderLength(beginWord: String, endWord: String, wordList: List<String>): Int {
        // Group words by wildcard patterns: "h*t" holds hit, hot, ...
        val buckets = HashMap<String, MutableList<String>>()
        for (word in wordList) {
            for (i in word.indices) {
                buckets.getOrPut(pattern(word, i)) { mutableListOf() }.add(word)
            }
        }

        // Level-by-level BFS.
        val visited = hashSetOf(beginWord)
        var level: List<String> = listOf(beginWord)
        var count = 1
        while (level.isNotEmpty()) {
            val next = mutableListOf<String>()
            for (word in level) {
                if (word == endWord) return count
                for (i in word.indices) {
                    // remove so each bucket is expanded only once
                    val bucket = buckets.remove(pattern(word, i)) ?: continue
                    for (neighbor in bucket) {
                        if (visited.add(neighbor)) next.add(neighbor)
                    }
                }
            }
            level = next
            count++
        }
        return 0
    }

    private fun pattern(word: String, i: Int): String =
        word.substring(0, i) + "*" + word.substring(i + 1)
}
