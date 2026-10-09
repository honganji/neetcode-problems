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
    var copies: [ObjectIdentifier: Node] = [:]

    func clone(_ original: Node) -> Node {
        if let existing = copies[ObjectIdentifier(original)] {
            return existing
        }

        // Register the copy before visiting neighbors, so cycles stop here.
        let copy = Node(original.val)
        copies[ObjectIdentifier(original)] = copy
        for case let neighbor? in original.neighbors {
            copy.neighbors.append(clone(neighbor))
        }
        return copy
    }

    return clone(node)
}
