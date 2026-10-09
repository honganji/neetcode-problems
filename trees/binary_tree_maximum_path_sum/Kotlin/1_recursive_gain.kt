// LeetCode provides this definition.
class TreeNode(var `val`: Int) {
    var left: TreeNode? = null
    var right: TreeNode? = null
}

fun maxPathSum(root: TreeNode?): Int {
    var best = Int.MIN_VALUE

    fun gain(node: TreeNode?): Int {
        if (node == null) return 0
        val left = maxOf(gain(node.left), 0)
        val right = maxOf(gain(node.right), 0)
        best = maxOf(best, node.`val` + left + right)
        return node.`val` + maxOf(left, right)
    }

    gain(root)
    return best
}
