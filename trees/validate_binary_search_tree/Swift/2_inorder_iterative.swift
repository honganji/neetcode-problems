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

func isValidBST(_ root: TreeNode?) -> Bool {
    var stack = [TreeNode]()
    var prev: Int? = nil
    var node = root
    while !stack.isEmpty || node != nil {
        while let current = node {
            stack.append(current)
            node = current.left
        }
        let current = stack.removeLast()
        if let prev = prev, current.val <= prev { return false }
        prev = current.val
        node = current.right
    }
    return true
}
