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
    func serialize(_ node: TreeNode?) -> [UInt8] {
        var parts = [UInt8]()
        func walk(_ current: TreeNode?) {
            guard let current = current else {
                parts.append(contentsOf: Array(",N".utf8))
                return
            }
            parts.append(contentsOf: Array(",#\(current.val)".utf8))
            walk(current.left)
            walk(current.right)
        }
        walk(node)
        return parts
    }

    func kmpContains(_ text: [UInt8], _ pattern: [UInt8]) -> Bool {
        var failure = [Int](repeating: 0, count: pattern.count)
        var k = 0
        for i in 1..<pattern.count {
            while k > 0 && pattern[i] != pattern[k] {
                k = failure[k - 1]
            }
            if pattern[i] == pattern[k] {
                k += 1
            }
            failure[i] = k
        }
        k = 0
        for ch in text {
            while k > 0 && ch != pattern[k] {
                k = failure[k - 1]
            }
            if ch == pattern[k] {
                k += 1
            }
            if k == pattern.count {
                return true
            }
        }
        return false
    }

    return kmpContains(serialize(root), serialize(subRoot))
}
