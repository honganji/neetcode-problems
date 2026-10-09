// LeetCode provides this definition.
public class Node {
    public var val: Int
    public var next: Node?
    public var random: Node?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
        self.random = nil
    }
}

func copyRandomList(_ head: Node?) -> Node? {
    var memo = [ObjectIdentifier: Node]()

    func copy(_ node: Node?) -> Node? {
        guard let node = node else {
            return nil
        }
        if let seen = memo[ObjectIdentifier(node)] {
            return seen
        }
        let clone = Node(node.val)
        memo[ObjectIdentifier(node)] = clone
        clone.next = copy(node.next)
        clone.random = copy(node.random)
        return clone
    }

    return copy(head)
}
