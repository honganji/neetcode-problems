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

    if lists.isEmpty { return nil }
    var current = lists
    while current.count > 1 {
        var merged = [ListNode?]()
        var i = 0
        while i < current.count {
            let a = current[i]
            let b = i + 1 < current.count ? current[i + 1] : nil
            merged.append(mergeTwo(a, b))
            i += 2
        }
        current = merged
    }
    return current[0]
}
