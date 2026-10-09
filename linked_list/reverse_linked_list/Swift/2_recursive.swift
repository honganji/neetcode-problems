// LeetCode provides this definition.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil }
    public init(_ val: Int) { self.val = val; self.next = nil }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next }
}

func reverseList(_ head: ListNode?) -> ListNode? {
    guard let node = head, let rest = node.next else {
        return head
    }
    let newHead = reverseList(rest)
    rest.next = node
    node.next = nil
    return newHead
}
