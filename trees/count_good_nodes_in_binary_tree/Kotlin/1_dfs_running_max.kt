// LeetCode provides this definition.
class TreeNode(var `val`: Int) {
    var left: TreeNode? = null
    var right: TreeNode? = null
}

fun goodNodes(root: TreeNode?): Int {
    fun dfs(node: TreeNode?, maxSoFar: Int): Int {
        if (node == null) return 0
        val count = if (node.`val` >= maxSoFar) 1 else 0
        val newMax = maxOf(maxSoFar, node.`val`)
        return count + dfs(node.left, newMax) + dfs(node.right, newMax)
    }

    if (root == null) return 0
    return dfs(root, root.`val`)
}
