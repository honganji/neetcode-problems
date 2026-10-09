// LeetCode provides this definition.
class TreeNode(var `val`: Int) {
    var left: TreeNode? = null
    var right: TreeNode? = null
}

fun diameterOfBinaryTree(root: TreeNode?): Int {
    if (root == null) return 0
    val heights = HashMap<TreeNode, Int>()
    var best = 0
    val stack = ArrayDeque<TreeNode>()
    stack.addLast(root)
    while (stack.isNotEmpty()) {
        val node = stack.last()
        val l = node.left
        val r = node.right
        if (l != null && !heights.containsKey(l)) {
            stack.addLast(l)
        } else if (r != null && !heights.containsKey(r)) {
            stack.addLast(r)
        } else {
            stack.removeLast()
            val left = if (l == null) 0 else heights[l]!!
            val right = if (r == null) 0 else heights[r]!!
            best = maxOf(best, left + right)
            heights[node] = 1 + maxOf(left, right)
        }
    }
    return best
}
