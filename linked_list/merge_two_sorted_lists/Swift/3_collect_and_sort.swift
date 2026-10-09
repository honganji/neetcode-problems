// LeetCode provides this definition.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil }
    public init(_ val: Int) { self.val = val; self.next = nil }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next }
}

func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
    var values = [Int]()
    for head in [list1, list2] {
        var node = head
        while let current = node {
            values.append(current.val)
            node = current.next
        }
    }
    values.sort()
    let dummy = ListNode()
    var tail = dummy
    for val in values {
        tail.next = ListNode(val)
        tail = tail.next!
    }
    return dummy.next
}
