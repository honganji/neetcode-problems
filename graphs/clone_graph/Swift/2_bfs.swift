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

    var copies: [ObjectIdentifier: Node] = [ObjectIdentifier(node): Node(node.val)]
    var queue: [Node] = [node]
    var head = 0  // read position; avoids the cost of removeFirst()

    while head < queue.count {
        let current = queue[head]
        head += 1
        let currentCopy = copies[ObjectIdentifier(current)]!

        for case let neighbor? in current.neighbors {
            let key = ObjectIdentifier(neighbor)
            if copies[key] == nil {
                // First time we see this neighbor: make its copy and schedule it.
                copies[key] = Node(neighbor.val)
                queue.append(neighbor)
            }
            currentCopy.neighbors.append(copies[key])
        }
    }

    return copies[ObjectIdentifier(node)]
}
