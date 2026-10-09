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
    var copies = [ObjectIdentifier: Node]()
    var node = head
    while let current = node {
        copies[ObjectIdentifier(current)] = Node(current.val)
        node = current.next
    }
    node = head
    while let current = node {
        let copy = copies[ObjectIdentifier(current)]!
        if let next = current.next {
            copy.next = copies[ObjectIdentifier(next)]
        }
        if let random = current.random {
            copy.random = copies[ObjectIdentifier(random)]
        }
        node = current.next
    }
    guard let head = head else {
        return nil
    }
    return copies[ObjectIdentifier(head)]
}
