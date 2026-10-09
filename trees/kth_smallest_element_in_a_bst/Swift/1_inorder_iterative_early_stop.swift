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

func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
    var stack = [TreeNode]()
    var node = root
    var remaining = k
    while !stack.isEmpty || node != nil {
        while let current = node {
            stack.append(current)
            node = current.left
        }
        let current = stack.removeLast()
        remaining -= 1
        if remaining == 0 {
            return current.val
        }
        node = current.right
    }
    return -1
}
