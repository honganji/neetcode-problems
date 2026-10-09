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

func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
    var best = 0

    func height(_ node: TreeNode?) -> Int {
        guard let node = node else { return 0 }
        let left = height(node.left)
        let right = height(node.right)
        best = max(best, left + right)
        return 1 + max(left, right)
    }

    _ = height(root)
    return best
}
