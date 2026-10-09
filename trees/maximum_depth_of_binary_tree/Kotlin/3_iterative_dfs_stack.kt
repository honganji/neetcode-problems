// LeetCode provides this definition.
class TreeNode(var `val`: Int) {
    var left: TreeNode? = null
    var right: TreeNode? = null
}

fun maxDepth(root: TreeNode?): Int {
    if (root == null) return 0
    val stack = ArrayDeque<Pair<TreeNode, Int>>()
    stack.addLast(Pair(root, 1))
    var best = 0
    while (stack.isNotEmpty()) {
        val (node, depth) = stack.removeLast()
        if (depth > best) best = depth
        node.left?.let { stack.addLast(Pair(it, depth + 1)) }
        node.right?.let { stack.addLast(Pair(it, depth + 1)) }
    }
    return best
}
