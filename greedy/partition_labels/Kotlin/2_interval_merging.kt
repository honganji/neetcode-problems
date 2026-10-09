class Solution {
    fun partitionLabels(s: String): List<Int> {
        // First and last index of each letter (-1 means the letter is absent).
        val first = IntArray(26) { -1 }
        val last = IntArray(26)
        for (i in s.indices) {
            val c = s[i] - 'a'
            if (first[c] == -1) first[c] = i
            last[c] = i
        }

        // Each letter covers an interval; sort them by start.
        val intervals = (0 until 26)
            .filter { first[it] != -1 }
            .map { first[it] to last[it] }
            .sortedBy { it.first }

        // Merge overlapping intervals; each merged block is one part.
        val result = mutableListOf<Int>()
        var start = intervals[0].first
        var end = intervals[0].second
        for ((lo, hi) in intervals.drop(1)) {
            if (lo > end) {
                result.add(end - start + 1)
                start = lo
                end = hi
            } else {
                end = maxOf(end, hi)
            }
        }
        result.add(end - start + 1)
        return result
    }
}
