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

private func height(_ node: TreeNode?) -> Int {
    guard let node = node else { return 0 }
    return 1 + max(height(node.left), height(node.right))
}

func isBalanced(_ root: TreeNode?) -> Bool {
    guard let root = root else { return true }
    if abs(height(root.left) - height(root.right)) > 1 { return false }
    return isBalanced(root.left) && isBalanced(root.right)
}
