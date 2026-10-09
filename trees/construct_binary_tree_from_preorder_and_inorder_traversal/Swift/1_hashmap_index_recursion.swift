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

func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
    var indexOf = [Int: Int]()
    for (i, val) in inorder.enumerated() {
        indexOf[val] = i
    }
    var prePos = 0

    func build(_ lo: Int, _ hi: Int) -> TreeNode? {
        if lo > hi { return nil }
        let val = preorder[prePos]
        prePos += 1
        let node = TreeNode(val)
        let mid = indexOf[val]!
        node.left = build(lo, mid - 1)
        node.right = build(mid + 1, hi)
        return node
    }

    return build(0, inorder.count - 1)
}
