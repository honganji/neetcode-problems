class Trie {
    private var words: Set<String> = []
    private var prefixes: Set<String> = [""]

    init() {}

    func insert(_ word: String) {
        words.insert(word)
        var prefix = ""
        for ch in word {
            prefix.append(ch)
            prefixes.insert(prefix)
        }
    }

    func search(_ word: String) -> Bool {
        return words.contains(word)
    }

    func startsWith(_ prefix: String) -> Bool {
        return prefixes.contains(prefix)
    }
}
