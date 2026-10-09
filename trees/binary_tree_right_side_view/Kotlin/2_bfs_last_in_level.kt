// LeetCode provides this definition.
class TreeNode(var `val`: Int) {
    var left: TreeNode? = null
    var right: TreeNode? = null
}

fun rightSideView(root: TreeNode?): List<Int> {
    if (root == null) return emptyList()
    val result = mutableListOf<Int>()
    val queue = ArrayDeque<TreeNode>()
    queue.addLast(root)
    while (queue.isNotEmpty()) {
        val levelSize = queue.size
        for (i in 0 until levelSize) {
            val node = queue.removeFirst()
            if (i == levelSize - 1) {
                result.add(node.`val`)
            }
            node.left?.let { queue.addLast(it) }
            node.right?.let { queue.addLast(it) }
        }
    }
    return result
}
