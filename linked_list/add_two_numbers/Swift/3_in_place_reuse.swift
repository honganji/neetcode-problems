// LeetCode provides this definition.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil }
    public init(_ val: Int) { self.val = val; self.next = nil }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next }
}

func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    guard let head = l1 else {
        return l2
    }
    var a: ListNode? = head
    var b = l2
    var prev = head
    var carry = 0
    while let x = a, let y = b {
        let total = x.val + y.val + carry
        x.val = total % 10
        carry = total / 10
        prev = x
        a = x.next
        b = y.next
    }
    if b != nil {
        prev.next = b
        a = b
    }
    while let x = a {
        let total = x.val + carry
        x.val = total % 10
        carry = total / 10
        prev = x
        a = x.next
    }
    if carry != 0 {
        prev.next = ListNode(carry)
    }
    return head
}
