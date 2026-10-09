// LeetCode provides this definition.
class TreeNode(var `val`: Int) {
    var left: TreeNode? = null
    var right: TreeNode? = null
}

fun maxPathSum(root: TreeNode?): Int {
    if (root == null) return 0
    var best = Int.MIN_VALUE
    val gains = HashMap<TreeNode, Int>()
    val stack = ArrayDeque<Pair<TreeNode, Boolean>>()
    stack.addLast(Pair(root, false))
    while (stack.isNotEmpty()) {
        val (node, visited) = stack.removeLast()
        if (!visited) {
            stack.addLast(Pair(node, true))
            node.right?.let { stack.addLast(Pair(it, false)) }
            node.left?.let { stack.addLast(Pair(it, false)) }
            continue
        }
        val left = node.left?.let { maxOf(gains[it] ?: 0, 0) } ?: 0
        val right = node.right?.let { maxOf(gains[it] ?: 0, 0) } ?: 0
        best = maxOf(best, node.`val` + left + right)
        gains[node] = node.`val` + maxOf(left, right)
    }
    return best
}
