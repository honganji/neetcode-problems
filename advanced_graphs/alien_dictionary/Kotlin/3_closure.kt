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

        // Floyd-Warshall: afterwards adj[u][v] is true if u must come before v, even indirectly
        for (k in 0 until 26) {
            for (i in 0 until 26) {
                if (!adj[i][k]) continue
                for (j in 0 until 26) {
                    if (adj[k][j]) adj[i][j] = true
                }
            }
        }

        // A letter that must come before itself means a cycle
        if ((0 until 26).any { adj[it][it] }) return ""

        // A letter that must come later has strictly more letters forced before it,
        // so sorting by that count gives a valid order
        val ancestorCount = IntArray(26)
        for (u in 0 until 26) {
            for (v in 0 until 26) {
                if (adj[u][v]) ancestorCount[v]++
            }
        }

        val letters = (0 until 26)
            .filter { present[it] }
            .sortedBy { ancestorCount[it] }
        return letters.map { 'a' + it }.joinToString("")
    }
}
