// LeetCode provides this definition.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil }
    public init(_ val: Int) { self.val = val; self.next = nil }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next }
}

func reverseList(_ head: ListNode?) -> ListNode? {
    var values = [Int]()
    var node = head
    while let current = node {
        values.append(current.val)
        node = current.next
    }
    let dummy = ListNode()
    var tail = dummy
    for val in values.reversed() {
        let newNode = ListNode(val)
        tail.next = newNode
        tail = newNode
    }
    return dummy.next
}
