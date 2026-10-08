fun groupAnagrams(strs: Array<String>): List<List<String>> {
    val groups = HashMap<List<Int>, MutableList<String>>()
    for (s in strs) {
        val counts = IntArray(26)
        for (ch in s) {
            counts[ch - 'a']++
        }
        groups.getOrPut(counts.toList()) { mutableListOf() }.add(s)
    }
    return groups.values.toList()
}
