fun groupAnagrams(strs: Array<String>): List<List<String>> {
    val groups = HashMap<String, MutableList<String>>()
    for (s in strs) {
        val key = String(s.toCharArray().apply { sort() })
        groups.getOrPut(key) { mutableListOf() }.add(s)
    }
    return groups.values.toList()
}
