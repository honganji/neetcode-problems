class Trie {
    final class Node {
        var children: [Character: Node] = [:]
        var isEnd = false
    }

    private let root = Node()

    init() {}

    func insert(_ word: String) {
        var node = root
        for ch in word {
            if let child = node.children[ch] {
                node = child
            } else {
                let child = Node()
                node.children[ch] = child
                node = child
            }
        }
        node.isEnd = true
    }

    func search(_ word: String) -> Bool {
        guard let node = find(word) else { return false }
        return node.isEnd
    }

    func startsWith(_ prefix: String) -> Bool {
        return find(prefix) != nil
    }

    private func find(_ key: String) -> Node? {
        var node = root
        for ch in key {
            guard let child = node.children[ch] else { return nil }
            node = child
        }
        return node
    }
}
