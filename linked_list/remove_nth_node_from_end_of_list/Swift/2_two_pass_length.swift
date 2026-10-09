// LeetCode provides this definition.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil }
    public init(_ val: Int) { self.val = val; self.next = nil }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next }
}

func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
    var length = 0
    var node = head
    while let current = node {
        length += 1
        node = current.next
    }
    let dummy = ListNode(0, head)
    var prev = dummy
    for _ in 0..<(length - n) {
        prev = prev.next!
    }
    prev.next = prev.next?.next
    return dummy.next
}
