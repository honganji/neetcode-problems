// LeetCode provides this definition.
class TreeNode(var `val`: Int) {
    var left: TreeNode? = null
    var right: TreeNode? = null
}

fun goodNodes(root: TreeNode?): Int {
    if (root == null) return 0
    var count = 0
    val queue = ArrayDeque<Pair<TreeNode, Int>>()
    queue.addLast(Pair(root, root.`val`))
    while (queue.isNotEmpty()) {
        val (node, maxSoFar) = queue.removeFirst()
        if (node.`val` >= maxSoFar) count++
        val newMax = maxOf(maxSoFar, node.`val`)
        node.left?.let { queue.addLast(Pair(it, newMax)) }
        node.right?.let { queue.addLast(Pair(it, newMax)) }
    }
    return count
}
