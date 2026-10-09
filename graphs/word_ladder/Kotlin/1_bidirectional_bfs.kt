class Solution {
    fun ladderLength(beginWord: String, endWord: String, wordList: List<String>): Int {
        val unvisited = wordList.toMutableSet()
        if (endWord !in unvisited) return 0

        // Search from both ends and always grow the smaller frontier.
        var front = mutableSetOf(beginWord)
        var back = mutableSetOf(endWord)
        unvisited.remove(beginWord)
        unvisited.remove(endWord)
        var steps = 1 // words in the path so far, counting beginWord

        while (front.isNotEmpty() && back.isNotEmpty()) {
            if (front.size > back.size) {
                val tmp = front
                front = back
                back = tmp
            }

            val nextFront = mutableSetOf<String>()
            for (word in front) {
                val chars = word.toCharArray()
                for (i in chars.indices) {
                    val original = chars[i]
                    for (c in 'a'..'z') {
                        if (c == original) continue
                        chars[i] = c
                        val candidate = String(chars)
                        if (candidate in back) return steps + 1 // the two searches meet
                        if (unvisited.remove(candidate)) nextFront.add(candidate)
                    }
                    chars[i] = original
                }
            }

            front = nextFront
            steps++
        }
        return 0
    }
}
