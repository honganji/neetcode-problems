public class Node {
    public var val: Int
    public var neighbors: [Node?]
    public init(_ val: Int) {
        self.val = val
        self.neighbors = []
    }
}

func cloneGraph(_ node: Node?) -> Node? {
    guard let node = node else { return nil }

    // No dictionary: every lookup scans the list of (original, copy) pairs.
    var pairs: [(original: Node, copy: Node)] = []

    func findCopy(_ original: Node) -> Node? {
        return pairs.first(where: { $0.original === original })?.copy
    }

    func clone(_ original: Node) -> Node {
        if let existing = findCopy(original) {
            return existing
        }

        let copy = Node(original.val)
        pairs.append((original: original, copy: copy))
        for case let neighbor? in original.neighbors {
            copy.neighbors.append(clone(neighbor))
        }
        return copy
    }

    return clone(node)
}
