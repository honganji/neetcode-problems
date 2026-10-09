class Trie {
    final class Node {
        var children: [Node?] = Array(repeating: nil, count: 26)
        var isEnd = false
    }

    private let root = Node()
    private let base = Int(UInt8(ascii: "a"))

    init() {}

    func insert(_ word: String) {
        var node = root
        for byte in word.utf8 {
            let index = Int(byte) - base
            if let child = node.children[index] {
                node = child
            } else {
                let child = Node()
                node.children[index] = child
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
        for byte in key.utf8 {
            guard let child = node.children[Int(byte) - base] else { return nil }
            node = child
        }
        return node
    }
}
