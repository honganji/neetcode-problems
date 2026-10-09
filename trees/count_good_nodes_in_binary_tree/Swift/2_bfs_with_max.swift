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

func goodNodes(_ root: TreeNode?) -> Int {
    guard let root = root else { return 0 }
    var count = 0
    var queue: [(TreeNode, Int)] = [(root, root.val)]
    var head = 0
    while head < queue.count {
        let (node, maxSoFar) = queue[head]
        head += 1
        if node.val >= maxSoFar {
            count += 1
        }
        let newMax = max(maxSoFar, node.val)
        if let left = node.left {
            queue.append((left, newMax))
        }
        if let right = node.right {
            queue.append((right, newMax))
        }
    }
    return count
}
