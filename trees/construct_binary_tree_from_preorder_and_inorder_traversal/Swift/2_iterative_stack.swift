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
    guard let first = preorder.first else { return nil }
    let root = TreeNode(first)
    var stack = [root]
    var inPos = 0
    for val in preorder.dropFirst() {
        let node = TreeNode(val)
        if stack[stack.count - 1].val != inorder[inPos] {
            stack[stack.count - 1].left = node
        } else {
            var parent = stack[stack.count - 1]
            while let top = stack.last, top.val == inorder[inPos] {
                parent = stack.removeLast()
                inPos += 1
            }
            parent.right = node
        }
        stack.append(node)
    }
    return root
}
