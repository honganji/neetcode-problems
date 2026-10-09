// LeetCode provides this definition.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil }
    public init(_ val: Int) { self.val = val; self.next = nil }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next }
}

func reorderList(_ head: ListNode?) {
    guard let head = head, head.next != nil else { return }

    var slow = head
    var fast = head
    while let next = fast.next, let afterNext = next.next {
        slow = slow.next!
        fast = afterNext
    }

    var second = slow.next
    slow.next = nil
    var prev: ListNode? = nil
    while let node = second {
        second = node.next
        node.next = prev
        prev = node
    }

    var first: ListNode? = head
    second = prev
    while let s = second, let f = first {
        let firstNext = f.next
        let secondNext = s.next
        f.next = s
        s.next = firstNext
        first = firstNext
        second = secondNext
    }
}
