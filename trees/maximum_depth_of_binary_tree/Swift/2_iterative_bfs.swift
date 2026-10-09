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

func maxDepth(_ root: TreeNode?) -> Int {
    guard let root = root else { return 0 }
    var queue = [root]
    var head = 0
    var depth = 0
    while head < queue.count {
        let levelEnd = queue.count
        while head < levelEnd {
            let node = queue[head]
            head += 1
            if let left = node.left { queue.append(left) }
            if let right = node.right { queue.append(right) }
        }
        depth += 1
    }
    return depth
}
