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
        guard let root = root else { return "" }
        var tokens: [String] = []
        var queue: [TreeNode?] = [root]
        var head = 0
        while head < queue.count {
            let node = queue[head]
            head += 1
            guard let node = node else {
                tokens.append("N")
                continue
            }
            tokens.append(String(node.val))
            queue.append(node.left)
            queue.append(node.right)
        }
        return tokens.joined(separator: ",")
    }

    func deserialize(_ data: String) -> TreeNode? {
        if data.isEmpty { return nil }
        let tokens = data.split(separator: ",", omittingEmptySubsequences: false)
        let root = TreeNode(Int(tokens[0])!)
        var queue: [TreeNode] = [root]
        var head = 0
        var i = 1
        while head < queue.count && i < tokens.count {
            let node = queue[head]
            head += 1
            if tokens[i] != "N" {
                let left = TreeNode(Int(tokens[i])!)
                node.left = left
                queue.append(left)
            }
            i += 1
            if i < tokens.count && tokens[i] != "N" {
                let right = TreeNode(Int(tokens[i])!)
                node.right = right
                queue.append(right)
            }
            i += 1
        }
        return root
    }
}
