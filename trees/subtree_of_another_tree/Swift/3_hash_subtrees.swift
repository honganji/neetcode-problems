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

func isSubtree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
    func buildKeys(_ node: TreeNode?, _ keys: inout [ObjectIdentifier: String]) -> String {
        guard let node = node else {
            return "N"
        }
        let leftKey = buildKeys(node.left, &keys)
        let rightKey = buildKeys(node.right, &keys)
        let key = "(#\(node.val)\(leftKey)\(rightKey))"
        keys[ObjectIdentifier(node)] = key
        return key
    }

    var subKeys = [ObjectIdentifier: String]()
    let target = buildKeys(subRoot, &subKeys)
    if subRoot == nil {
        return true
    }
    var rootKeys = [ObjectIdentifier: String]()
    _ = buildKeys(root, &rootKeys)
    return rootKeys.values.contains(target)
}
