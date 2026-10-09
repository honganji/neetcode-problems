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

func isBalanced(_ root: TreeNode?) -> Bool {
    guard let root = root else { return true }
    var heights = [ObjectIdentifier: Int]()
    var stack: [(node: TreeNode, visited: Bool)] = [(root, false)]
    while let top = stack.popLast() {
        let (node, visited) = top
        if visited {
            let left = node.left.map { heights[ObjectIdentifier($0)] ?? 0 } ?? 0
            let right = node.right.map { heights[ObjectIdentifier($0)] ?? 0 } ?? 0
            if abs(left - right) > 1 { return false }
            heights[ObjectIdentifier(node)] = 1 + max(left, right)
        } else {
            stack.append((node, true))
            if let right = node.right { stack.append((right, false)) }
            if let left = node.left { stack.append((left, false)) }
        }
    }
    return true
}
