// LeetCode provides this definition.
class TreeNode(var `val`: Int) {
    var left: TreeNode? = null
    var right: TreeNode? = null
}

fun goodNodes(root: TreeNode?): Int {
    if (root == null) return 0
    var count = 0
    val stack = ArrayDeque<Pair<TreeNode, Int>>()
    stack.addLast(Pair(root, root.`val`))
    while (stack.isNotEmpty()) {
        val (node, maxSoFar) = stack.removeLast()
        if (node.`val` >= maxSoFar) count++
        val newMax = maxOf(maxSoFar, node.`val`)
        node.right?.let { stack.addLast(Pair(it, newMax)) }
        node.left?.let { stack.addLast(Pair(it, newMax)) }
    }
    return count
}
