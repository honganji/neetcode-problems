// LeetCode provides this definition.
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
    var queue: [(TreeNode?, TreeNode?)] = [(p, q)]
    var head = 0
    while head < queue.count {
        let (a, b) = queue[head]
        head += 1
        if a == nil && b == nil { continue }
        guard let a = a, let b = b, a.val == b.val else { return false }
        queue.append((a.left, b.left))
        queue.append((a.right, b.right))
    }
    return true
}
