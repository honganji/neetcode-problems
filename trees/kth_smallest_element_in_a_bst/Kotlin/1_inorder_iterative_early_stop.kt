// LeetCode provides this definition.
class TreeNode(var `val`: Int) {
    var left: TreeNode? = null
    var right: TreeNode? = null
}

fun kthSmallest(root: TreeNode?, k: Int): Int {
    val stack = ArrayDeque<TreeNode>()
    var node = root
    var remaining = k
    while (stack.isNotEmpty() || node != null) {
        while (node != null) {
            stack.addLast(node)
            node = node.left
        }
        val current = stack.removeLast()
        remaining--
        if (remaining == 0) {
            return current.`val`
        }
        node = current.right
    }
    return -1
}
