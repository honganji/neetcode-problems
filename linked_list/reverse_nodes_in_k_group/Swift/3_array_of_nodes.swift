// LeetCode provides this definition.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil }
    public init(_ val: Int) { self.val = val; self.next = nil }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next }
}

func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
    var nodes = [ListNode]()
    var node = head
    while let n = node {
        nodes.append(n)
        node = n.next
    }

    let fullEnd = nodes.count - nodes.count % k
    var start = 0
    while start < fullEnd {
        nodes[start..<(start + k)].reverse()
        start += k
    }

    for i in 0..<max(nodes.count - 1, 0) {
        nodes[i].next = nodes[i + 1]
    }
    guard let last = nodes.last else {
        return nil
    }
    last.next = nil
    return nodes.first
}
