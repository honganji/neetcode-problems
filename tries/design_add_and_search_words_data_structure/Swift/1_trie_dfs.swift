class WordDictionary {
    final class Node {
        var children = [Node?](repeating: nil, count: 26)
        var isWord = false
    }

    private let root = Node()
    private let base = Int(UInt8(ascii: "a"))
    private let dot = Int(UInt8(ascii: "."))

    init() {}

    func addWord(_ word: String) {
        var node = root
        for byte in word.utf8 {
            let idx = Int(byte) - base
            if node.children[idx] == nil {
                node.children[idx] = Node()
            }
            node = node.children[idx]!
        }
        node.isWord = true
    }

    func search(_ word: String) -> Bool {
        return dfs(root, Array(word.utf8), 0)
    }

    private func dfs(_ node: Node, _ word: [UInt8], _ i: Int) -> Bool {
        if i == word.count {
            return node.isWord
        }
        let code = Int(word[i])
        if code == dot {
            for case let child? in node.children where dfs(child, word, i + 1) {
                return true
            }
            return false
        }
        guard let child = node.children[code - base] else {
            return false
        }
        return dfs(child, word, i + 1)
    }
}
