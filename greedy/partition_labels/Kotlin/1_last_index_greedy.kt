class Solution {
    fun partitionLabels(s: String): List<Int> {
        // Remember where each letter appears last.
        val last = IntArray(26)
        for (i in s.indices) last[s[i] - 'a'] = i

        val result = mutableListOf<Int>()
        var start = 0 // where the current part begins
        var end = 0 // furthest last-occurrence seen in the current part
        for (i in s.indices) {
            end = maxOf(end, last[s[i] - 'a'])
            // Every letter seen so far ends inside this part, so cut here.
            if (i == end) {
                result.add(end - start + 1)
                start = i + 1
            }
        }
        return result
    }
}
