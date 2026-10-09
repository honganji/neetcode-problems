// LeetCode provides this definition.
class TreeNode(var `val`: Int) {
    var left: TreeNode? = null
    var right: TreeNode? = null
}

fun levelOrder(root: TreeNode?): List<List<Int>> {
    val result = mutableListOf<MutableList<Int>>()
    if (root == null) return result
    val stack = ArrayDeque<Pair<TreeNode, Int>>()
    stack.addLast(Pair(root, 0))
    while (stack.isNotEmpty()) {
        val (node, depth) = stack.removeLast()
        if (depth == result.size) result.add(mutableListOf())
        result[depth].add(node.`val`)
        node.right?.let { stack.addLast(Pair(it, depth + 1)) }
        node.left?.let { stack.addLast(Pair(it, depth + 1)) }
    }
    return result
}
