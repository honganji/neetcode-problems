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

func levelOrder(_ root: TreeNode?) -> [[Int]] {
    guard let root = root else { return [] }
    var result = [[Int]]()
    var stack: [(TreeNode, Int)] = [(root, 0)]
    while let top = stack.popLast() {
        let (node, depth) = top
        if depth == result.count {
            result.append([])
        }
        result[depth].append(node.val)
        if let right = node.right { stack.append((right, depth + 1)) }
        if let left = node.left { stack.append((left, depth + 1)) }
    }
    return result
}
