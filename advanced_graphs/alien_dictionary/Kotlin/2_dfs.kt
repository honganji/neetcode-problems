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

        // 0 = not visited, 1 = on the current DFS path, 2 = finished
        val state = IntArray(26)
        val postorder = ArrayList<Int>()

        fun dfs(u: Int): Boolean {
            state[u] = 1
            for (v in 0 until 26) {
                if (!adj[u][v]) continue
                // Reaching a letter that is still on the path means a cycle
                if (state[v] == 1) return false
                if (state[v] == 0 && !dfs(v)) return false
            }
            state[u] = 2
            postorder.add(u)
            return true
        }

        for (c in 0 until 26) {
            if (present[c] && state[c] == 0 && !dfs(c)) return ""
        }

        // A letter finishes only after every letter it points to, so reversing finish order works
        val order = StringBuilder()
        for (c in postorder.asReversed()) order.append('a' + c)
        return order.toString()
    }
}
