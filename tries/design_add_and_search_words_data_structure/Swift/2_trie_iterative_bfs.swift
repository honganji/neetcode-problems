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
        let chars = Array(word.utf8)
        var stack: [(Node, Int)] = [(root, 0)]
        while let (node, i) = stack.popLast() {
            if i == chars.count {
                if node.isWord {
                    return true
                }
                continue
            }
            let code = Int(chars[i])
            if code == dot {
                for case let child? in node.children {
                    stack.append((child, i + 1))
                }
            } else if let child = node.children[code - base] {
                stack.append((child, i + 1))
            }
        }
        return false
    }
}
