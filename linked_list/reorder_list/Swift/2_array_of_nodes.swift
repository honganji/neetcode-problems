// LeetCode provides this definition.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil }
    public init(_ val: Int) { self.val = val; self.next = nil }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next }
}

func reorderList(_ head: ListNode?) {
    var nodes = [ListNode]()
    var node = head
    while let n = node {
        nodes.append(n)
        node = n.next
    }
    if nodes.isEmpty { return }

    var left = 0
    var right = nodes.count - 1
    while left < right {
        nodes[left].next = nodes[right]
        left += 1
        if left == right { break }
        nodes[right].next = nodes[left]
        right -= 1
    }
    nodes[left].next = nil
}
