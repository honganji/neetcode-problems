// LeetCode provides this definition.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil }
    public init(_ val: Int) { self.val = val; self.next = nil }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next }
}

func reorderList(_ head: ListNode?) {
    var current = head
    while let cur = current, let next = cur.next, next.next != nil {
        var beforeTail = cur
        while beforeTail.next!.next != nil {
            beforeTail = beforeTail.next!
        }
        let tail = beforeTail.next!
        beforeTail.next = nil
        tail.next = next
        cur.next = tail
        current = tail.next
    }
}
