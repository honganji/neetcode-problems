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

func bestDownward(_ node: TreeNode?) -> Int {
    guard let node = node else { return 0 }
    return node.val + max(bestDownward(node.left), bestDownward(node.right), 0)
}

func maxPathSum(_ root: TreeNode?) -> Int {
    guard let root = root else { return Int.min }
    let left = max(bestDownward(root.left), 0)
    let right = max(bestDownward(root.right), 0)
    let through = root.val + left + right
    return max(through, maxPathSum(root.left), maxPathSum(root.right))
}
