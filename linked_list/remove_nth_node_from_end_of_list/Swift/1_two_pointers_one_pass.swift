// LeetCode provides this definition.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil }
    public init(_ val: Int) { self.val = val; self.next = nil }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next }
}

func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
    let dummy = ListNode(0, head)
    var fast: ListNode? = dummy
    var slow = dummy
    for _ in 0..<(n + 1) {
        fast = fast?.next
    }
    while fast != nil {
        fast = fast?.next
        slow = slow.next!
    }
    slow.next = slow.next?.next
    return dummy.next
}
