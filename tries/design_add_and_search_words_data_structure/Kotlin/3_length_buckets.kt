class WordDictionary() {
    private val buckets = HashMap<Int, MutableList<String>>()

    fun addWord(word: String) {
        buckets.getOrPut(word.length) { mutableListOf() }.add(word)
    }

    fun search(word: String): Boolean {
        val candidates = buckets[word.length] ?: return false
        return candidates.any { matches(word, it) }
    }

    private fun matches(pattern: String, candidate: String): Boolean {
        for (i in pattern.indices) {
            val p = pattern[i]
            if (p != '.' && p != candidate[i]) {
                return false
            }
        }
        return true
    }
}
