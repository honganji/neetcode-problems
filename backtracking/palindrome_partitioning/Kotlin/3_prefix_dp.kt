class Solution {
    fun partition(s: String): List<List<String>> {
        val n = s.length
        // partitions[i] holds every way to split the first i characters.
        val partitions = Array(n + 1) { mutableListOf<List<String>>() }
        partitions[0].add(emptyList())

        for (end in 1..n) {
            for (start in 0 until end) {
                if (!isPalindrome(s, start, end - 1)) continue
                val last = s.substring(start, end)
                for (prefix in partitions[start]) {
                    partitions[end].add(prefix + last)
                }
            }
        }
        return partitions[n]
    }

    private fun isPalindrome(s: String, from: Int, to: Int): Boolean {
        var l = from
        var r = to
        while (l < r) {
            if (s[l] != s[r]) return false
            l++
            r--
        }
        return true
    }
}
