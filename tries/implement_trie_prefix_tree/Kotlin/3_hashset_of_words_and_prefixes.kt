class Trie() {
    private val words = HashSet<String>()
    private val prefixes = hashSetOf("")

    fun insert(word: String) {
        words.add(word)
        for (end in 1..word.length) {
            prefixes.add(word.substring(0, end))
        }
    }

    fun search(word: String): Boolean {
        return words.contains(word)
    }

    fun startsWith(prefix: String): Boolean {
        return prefixes.contains(prefix)
    }
}
