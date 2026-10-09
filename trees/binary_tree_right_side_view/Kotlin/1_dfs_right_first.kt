// LeetCode provides this definition.
class TreeNode(var `val`: Int) {
    var left: TreeNode? = null
    var right: TreeNode? = null
}

fun rightSideView(root: TreeNode?): List<Int> {
    val result = mutableListOf<Int>()

    fun dfs(node: TreeNode?, depth: Int) {
        if (node == null) return
        if (depth == result.size) {
            result.add(node.`val`)
        }
        dfs(node.right, depth + 1)
        dfs(node.left, depth + 1)
    }

    dfs(root, 0)
    return result
}
