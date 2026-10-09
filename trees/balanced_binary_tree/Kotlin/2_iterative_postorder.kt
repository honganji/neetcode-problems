// LeetCode provides this definition.
class TreeNode(var `val`: Int) {
    var left: TreeNode? = null
    var right: TreeNode? = null
}

fun isBalanced(root: TreeNode?): Boolean {
    if (root == null) return true
    val heights = HashMap<TreeNode, Int>()
    val stack = ArrayDeque<Pair<TreeNode, Boolean>>()
    stack.addLast(Pair(root, false))
    while (stack.isNotEmpty()) {
        val (node, visited) = stack.removeLast()
        if (visited) {
            val left = node.left?.let { heights[it] } ?: 0
            val right = node.right?.let { heights[it] } ?: 0
            if (Math.abs(left - right) > 1) return false
            heights[node] = 1 + maxOf(left, right)
        } else {
            stack.addLast(Pair(node, true))
            node.right?.let { stack.addLast(Pair(it, false)) }
            node.left?.let { stack.addLast(Pair(it, false)) }
        }
    }
    return true
}
