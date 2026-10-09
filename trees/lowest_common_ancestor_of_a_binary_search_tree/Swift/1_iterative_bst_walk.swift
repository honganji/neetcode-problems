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

func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
    guard let p = p, let q = q else { return nil }
    var node = root
    while let current = node {
        if p.val < current.val && q.val < current.val {
            node = current.left
        } else if p.val > current.val && q.val > current.val {
            node = current.right
        } else {
            return current
        }
    }
    return nil
}
