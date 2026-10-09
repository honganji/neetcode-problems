// LeetCode provides this definition.
class TreeNode(var `val`: Int) {
    var left: TreeNode? = null
    var right: TreeNode? = null
}

fun invertTree(root: TreeNode?): TreeNode? {
    if (root == null) {
        return null
    }
    val stack = ArrayDeque<TreeNode>()
    stack.addLast(root)
    while (stack.isNotEmpty()) {
        val node = stack.removeLast()
        val temp = node.left
        node.left = node.right
        node.right = temp
        node.left?.let { stack.addLast(it) }
        node.right?.let { stack.addLast(it) }
    }
    return root
}
