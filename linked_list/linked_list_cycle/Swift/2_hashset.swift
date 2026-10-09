// LeetCode provides this definition.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil }
    public init(_ val: Int) { self.val = val; self.next = nil }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next }
}

func hasCycle(_ head: ListNode?) -> Bool {
    var visited = Set<ObjectIdentifier>()
    var node = head
    while let current = node {
        let id = ObjectIdentifier(current)
        if visited.contains(id) {
            return true
        }
        visited.insert(id)
        node = current.next
    }
    return false
}
