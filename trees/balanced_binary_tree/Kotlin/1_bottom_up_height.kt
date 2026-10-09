// LeetCode provides this definition.
class TreeNode(var `val`: Int) {
    var left: TreeNode? = null
    var right: TreeNode? = null
}

fun isBalanced(root: TreeNode?): Boolean {
    fun height(node: TreeNode?): Int {
        if (node == null) return 0
        val left = height(node.left)
        if (left == -1) return -1
        val right = height(node.right)
        if (right == -1) return -1
        if (Math.abs(left - right) > 1) return -1
        return 1 + maxOf(left, right)
    }

    return height(root) != -1
}
