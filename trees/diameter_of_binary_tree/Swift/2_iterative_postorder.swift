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

func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
    guard let root = root else { return 0 }
    var heights = [ObjectIdentifier: Int]()
    var best = 0
    var stack: [TreeNode] = [root]
    while let node = stack.last {
        if let l = node.left, heights[ObjectIdentifier(l)] == nil {
            stack.append(l)
        } else if let r = node.right, heights[ObjectIdentifier(r)] == nil {
            stack.append(r)
        } else {
            stack.removeLast()
            let left = node.left.map { heights[ObjectIdentifier($0)]! } ?? 0
            let right = node.right.map { heights[ObjectIdentifier($0)]! } ?? 0
            best = max(best, left + right)
            heights[ObjectIdentifier(node)] = 1 + max(left, right)
        }
    }
    return best
}
