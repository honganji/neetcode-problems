// LeetCode provides this definition.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil }
    public init(_ val: Int) { self.val = val; self.next = nil }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next }
}

func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
    let dummy = ListNode(0, head)
    var groupPrev = dummy

    while true {
        var kth: ListNode? = groupPrev
        for _ in 0..<k {
            kth = kth?.next
            if kth == nil {
                return dummy.next
            }
        }
        let groupNext = kth?.next

        var prev = groupNext
        var curr = groupPrev.next
        while curr !== groupNext {
            let nxt = curr?.next
            curr?.next = prev
            prev = curr
            curr = nxt
        }

        let first = groupPrev.next!
        groupPrev.next = kth
        groupPrev = first
    }
}
