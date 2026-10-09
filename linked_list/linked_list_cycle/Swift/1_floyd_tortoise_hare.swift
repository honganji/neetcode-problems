// LeetCode provides this definition.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil }
    public init(_ val: Int) { self.val = val; self.next = nil }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next }
}

func hasCycle(_ head: ListNode?) -> Bool {
    var slow = head
    var fast = head
    while let f = fast, let fNext = f.next {
        slow = slow?.next
        fast = fNext.next
        if slow === fast {
            return true
        }
    }
    return false
}
