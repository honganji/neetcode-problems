// LeetCode provides this definition.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil }
    public init(_ val: Int) { self.val = val; self.next = nil }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next }
}

func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
    func mergeTwo(_ first: ListNode?, _ second: ListNode?) -> ListNode? {
        var a = first
        var b = second
        let dummy = ListNode()
        var tail = dummy
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

    var result: ListNode? = nil
    for head in lists {
        result = mergeTwo(result, head)
    }
    return result
}
