class WordDictionary {
    private var buckets: [Int: [[Character]]] = [:]

    init() {}

    func addWord(_ word: String) {
        buckets[word.count, default: []].append(Array(word))
    }

    func search(_ word: String) -> Bool {
        let pattern = Array(word)
        guard let candidates = buckets[pattern.count] else {
            return false
        }
        for candidate in candidates where matches(pattern, candidate) {
            return true
        }
        return false
    }

    private func matches(_ pattern: [Character], _ candidate: [Character]) -> Bool {
        for i in 0..<pattern.count where pattern[i] != "." && pattern[i] != candidate[i] {
            return false
        }
        return true
    }
}
