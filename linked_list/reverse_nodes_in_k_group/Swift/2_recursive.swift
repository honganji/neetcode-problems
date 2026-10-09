// LeetCode provides this definition.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil }
    public init(_ val: Int) { self.val = val; self.next = nil }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next }
}

func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
    var node = head
    var count = 0
    while let n = node, count < k {
        node = n.next
        count += 1
    }
    if count < k {
        return head
    }

    var prev: ListNode? = nil
    var curr = head
    for _ in 0..<k {
        let nxt = curr?.next
        curr?.next = prev
        prev = curr
        curr = nxt
    }

    head?.next = reverseKGroup(curr, k)
    return prev
}
