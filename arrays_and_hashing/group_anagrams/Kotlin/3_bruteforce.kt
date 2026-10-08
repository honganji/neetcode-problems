fun groupAnagrams(strs: Array<String>): List<List<String>> {
    fun letterCounts(s: String): IntArray {
        val counts = IntArray(26)
        for (ch in s) {
            counts[ch - 'a']++
        }
        return counts
    }

    val counts = strs.map(::letterCounts)
    val visited = BooleanArray(strs.size)
    val result = mutableListOf<List<String>>()
    for (i in strs.indices) {
        if (visited[i]) continue
        val group = mutableListOf(strs[i])
        visited[i] = true
        for (j in i + 1 until strs.size) {
            if (!visited[j] && counts[i].contentEquals(counts[j])) {
                group.add(strs[j])
                visited[j] = true
            }
        }
        result.add(group)
    }
    return result
}
