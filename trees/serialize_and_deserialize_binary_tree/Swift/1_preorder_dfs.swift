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

class Codec {
    func serialize(_ root: TreeNode?) -> String {
        var tokens: [String] = []

        func dfs(_ node: TreeNode?) {
            guard let node = node else {
                tokens.append("N")
                return
            }
            tokens.append(String(node.val))
            dfs(node.left)
            dfs(node.right)
        }

        dfs(root)
        return tokens.joined(separator: ",")
    }

    func deserialize(_ data: String) -> TreeNode? {
        let tokens = data.split(separator: ",", omittingEmptySubsequences: false)
        var index = 0

        func build() -> TreeNode? {
            let token = tokens[index]
            index += 1
            if token == "N" { return nil }
            let node = TreeNode(Int(token)!)
            node.left = build()
            node.right = build()
            return node
        }

        return build()
    }
}
