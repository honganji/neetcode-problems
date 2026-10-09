// LeetCode provides this definition.
class TreeNode(var `val`: Int) {
    var left: TreeNode? = null
    var right: TreeNode? = null
}

fun invertTree(root: TreeNode?): TreeNode? {
    if (root == null) {
        return null
    }
    val queue = ArrayDeque<TreeNode>()
    queue.addLast(root)
    while (queue.isNotEmpty()) {
        val node = queue.removeFirst()
        val temp = node.left
        node.left = node.right
        node.right = temp
        node.left?.let { queue.addLast(it) }
        node.right?.let { queue.addLast(it) }
    }
    return root
}
