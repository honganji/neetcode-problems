// LeetCode provides this definition.
class TreeNode(var `val`: Int) {
    var left: TreeNode? = null
    var right: TreeNode? = null
}

private fun serialize(node: TreeNode?): String {
    val parts = mutableListOf<String>()
    val stack = ArrayDeque<TreeNode?>()
    stack.addLast(node)
    while (stack.isNotEmpty()) {
        val current = stack.removeLast()
        if (current == null) {
            parts.add("#")
            continue
        }
        parts.add(current.`val`.toString())
        stack.addLast(current.right)
        stack.addLast(current.left)
    }
    return parts.joinToString(",")
}

fun isSameTree(p: TreeNode?, q: TreeNode?): Boolean {
    return serialize(p) == serialize(q)
}
