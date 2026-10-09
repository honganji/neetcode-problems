// LeetCode provides this definition.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil }
    public init(_ val: Int) { self.val = val; self.next = nil }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next }
}

func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
    let dummy = ListNode()
    var tail = dummy
    var a = list1
    var b = list2
    while let x = a, let y = b {
        if x.val <= y.val {
            tail.next = x
            a = x.next
        } else {
            tail.next = y
            b = y.next
        }
        tail = tail.next!
    }
    tail.next = a ?? b
    return dummy.next
}
