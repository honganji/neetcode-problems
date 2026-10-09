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
    var values = [Int]()

    func inorder(_ node: TreeNode?) {
        guard let node = node else { return }
        inorder(node.left)
        values.append(node.val)
        inorder(node.right)
    }

    inorder(root)
    for i in values.indices.dropFirst() {
        if values[i] <= values[i - 1] { return false }
    }
    return true
}
