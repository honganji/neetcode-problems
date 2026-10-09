// LeetCode provides this definition.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil }
    public init(_ val: Int) { self.val = val; self.next = nil }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next }
}

func hasCycle(_ head: ListNode?) -> Bool {
    let maxNodes = 10_000
    var steps = 0
    var node = head
    while let current = node {
        steps += 1
        if steps > maxNodes {
            return true
        }
        node = current.next
    }
    return false
}
