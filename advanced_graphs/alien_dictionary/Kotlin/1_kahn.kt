import java.util.ArrayDeque

class Solution {
    fun alienOrder(words: Array<String>): String {
        // Letters are numbered 0..25 (a..z). adj[u][v] is true when u must come before v.
        val present = BooleanArray(26)
        val adj = Array(26) { BooleanArray(26) }

        for (word in words) {
            for (ch in word) present[ch - 'a'] = true
        }

        for (i in 0 until words.size - 1) {
            val first = words[i]
            val second = words[i + 1]
            val limit = minOf(first.length, second.length)
            var j = 0
            while (j < limit && first[j] == second[j]) j++
            if (j == limit) {
                // "abc" before "ab" can never be sorted
                if (first.length > second.length) return ""
                continue
            }
            adj[first[j] - 'a'][second[j] - 'a'] = true
        }

        // Count how many letters must come right before each letter
        val indegree = IntArray(26)
        for (u in 0 until 26) {
            for (v in 0 until 26) {
                if (adj[u][v]) indegree[v]++
            }
        }

        // Letters with nothing blocking them can go first
        val queue = ArrayDeque<Int>()
        var total = 0
        for (c in 0 until 26) {
            if (present[c]) {
                total++
                if (indegree[c] == 0) queue.add(c)
            }
        }

        val order = StringBuilder()
        while (queue.isNotEmpty()) {
            val u = queue.poll()
            order.append('a' + u)
            for (v in 0 until 26) {
                if (adj[u][v]) {
                    indegree[v]--
                    if (indegree[v] == 0) queue.add(v)
                }
            }
        }

        // Letters stuck with blockers form a cycle, so no valid order exists
        return if (order.length == total) order.toString() else ""
    }
}
