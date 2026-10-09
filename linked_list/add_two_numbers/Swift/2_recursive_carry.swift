// LeetCode provides this definition.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil }
    public init(_ val: Int) { self.val = val; self.next = nil }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next }
}

func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    func add(_ a: ListNode?, _ b: ListNode?, _ carry: Int) -> ListNode? {
        if a == nil && b == nil && carry == 0 {
            return nil
        }
        let total = carry + (a?.val ?? 0) + (b?.val ?? 0)
        return ListNode(total % 10, add(a?.next, b?.next, total / 10))
    }

    return add(l1, l2, 0)
}
