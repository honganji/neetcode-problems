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
    guard let root = root else { return 0 }
    var best = Int.min
    var gains = [ObjectIdentifier: Int]()
    var stack: [(TreeNode, Bool)] = [(root, false)]
    while let top = stack.popLast() {
        let (node, visited) = top
        if !visited {
            stack.append((node, true))
            if let r = node.right { stack.append((r, false)) }
            if let l = node.left { stack.append((l, false)) }
            continue
        }
        var left = 0
        if let l = node.left { left = max(gains[ObjectIdentifier(l)] ?? 0, 0) }
        var right = 0
        if let r = node.right { right = max(gains[ObjectIdentifier(r)] ?? 0, 0) }
        best = max(best, node.val + left + right)
        gains[ObjectIdentifier(node)] = node.val + max(left, right)
    }
    return best
}
