class Solution {
    fun partitionLabels(s: String): List<Int> {
        val result = mutableListOf<Int>()
        var start = 0
        while (start < s.length) {
            // Find the earliest end where no letter in the part appears later.
            var end = start
            while (crossesCut(s, start, end)) end++
            result.add(end - start + 1)
            start = end + 1
        }
        return result
    }

    private fun crossesCut(s: String, start: Int, end: Int): Boolean {
        val after = s.substring(end + 1)
        return (start..end).any { after.indexOf(s[it]) >= 0 }
    }
}
