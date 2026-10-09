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

func maxPathSum(_ root: TreeNode?) -> Int {
    var best = Int.min

    func gain(_ node: TreeNode?) -> Int {
        guard let node = node else { return 0 }
        let left = max(gain(node.left), 0)
        let right = max(gain(node.right), 0)
        best = max(best, node.val + left + right)
        return node.val + max(left, right)
    }

    gain(root)
    return best
}
