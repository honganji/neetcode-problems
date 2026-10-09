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

func height(_ node: TreeNode?) -> Int {
    guard let node = node else { return 0 }
    return 1 + max(height(node.left), height(node.right))
}

func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
    guard let root = root else { return 0 }
    let throughRoot = height(root.left) + height(root.right)
    return max(
        throughRoot,
        diameterOfBinaryTree(root.left),
        diameterOfBinaryTree(root.right)
    )
}
