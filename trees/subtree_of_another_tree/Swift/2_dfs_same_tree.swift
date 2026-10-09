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

func isSubtree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
    func isSameTree(_ a: TreeNode?, _ b: TreeNode?) -> Bool {
        guard let a = a, let b = b else {
            return a == nil && b == nil
        }
        return a.val == b.val
            && isSameTree(a.left, b.left)
            && isSameTree(a.right, b.right)
    }

    guard let subRoot = subRoot else {
        return true
    }
    guard let root = root else {
        return false
    }
    if isSameTree(root, subRoot) {
        return true
    }
    return isSubtree(root.left, subRoot) || isSubtree(root.right, subRoot)
}
