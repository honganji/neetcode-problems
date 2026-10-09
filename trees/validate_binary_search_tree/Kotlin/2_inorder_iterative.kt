// LeetCode provides this definition.
class TreeNode(var `val`: Int) {
    var left: TreeNode? = null
    var right: TreeNode? = null
}

fun isValidBST(root: TreeNode?): Boolean {
    val stack = ArrayDeque<TreeNode>()
    var prev: Int? = null
    var node = root
    while (stack.isNotEmpty() || node != null) {
        while (node != null) {
            stack.addLast(node)
            node = node.left
        }
        val current = stack.removeLast()
        if (prev != null && current.`val` <= prev) return false
        prev = current.`val`
        node = current.right
    }
    return true
}
