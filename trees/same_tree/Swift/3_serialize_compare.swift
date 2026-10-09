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

private func serialize(_ node: TreeNode?) -> String {
    var parts: [String] = []
    var stack: [TreeNode?] = [node]
    while let current = stack.popLast() {
        guard let current = current else {
            parts.append("#")
            continue
        }
        parts.append(String(current.val))
        stack.append(current.right)
        stack.append(current.left)
    }
    return parts.joined(separator: ",")
}

func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
    return serialize(p) == serialize(q)
}
