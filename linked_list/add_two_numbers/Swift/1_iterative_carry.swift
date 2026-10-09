// LeetCode provides this definition.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil }
    public init(_ val: Int) { self.val = val; self.next = nil }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next }
}

func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    let dummy = ListNode()
    var tail = dummy
    var a = l1
    var b = l2
    var carry = 0
    while a != nil || b != nil || carry != 0 {
        var total = carry
        if let node = a {
            total += node.val
            a = node.next
        }
        if let node = b {
            total += node.val
            b = node.next
        }
        carry = total / 10
        let next = ListNode(total % 10)
        tail.next = next
        tail = next
    }
    return dummy.next
}
