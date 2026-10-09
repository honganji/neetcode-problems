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
    guard let head = head else {
        return nil
    }
    var node: Node? = head
    while let current = node {
        let copy = Node(current.val)
        copy.next = current.next
        current.next = copy
        node = copy.next
    }
    node = head
    while let current = node {
        if let random = current.random {
            current.next!.random = random.next
        }
        node = current.next!.next
    }
    let newHead = head.next
    node = head
    while let current = node {
        let copy = current.next!
        current.next = copy.next
        if let afterCopy = copy.next {
            copy.next = afterCopy.next
        }
        node = current.next
    }
    return newHead
}
