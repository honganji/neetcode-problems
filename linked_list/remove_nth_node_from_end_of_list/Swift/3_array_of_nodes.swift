// LeetCode provides this definition.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil }
    public init(_ val: Int) { self.val = val; self.next = nil }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next }
}

func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
    var nodes = [ListNode]()
    var node = head
    while let current = node {
        nodes.append(current)
        node = current.next
    }
    let index = nodes.count - n
    if index == 0 {
        return head?.next
    }
    nodes[index - 1].next = nodes[index].next
    return head
}
