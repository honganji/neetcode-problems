// LeetCode provides this definition.
class TreeNode(var `val`: Int) {
    var left: TreeNode? = null
    var right: TreeNode? = null
}

private fun height(node: TreeNode?): Int {
    if (node == null) return 0
    return 1 + maxOf(height(node.left), height(node.right))
}

fun isBalanced(root: TreeNode?): Boolean {
    if (root == null) return true
    if (Math.abs(height(root.left) - height(root.right)) > 1) return false
    return isBalanced(root.left) && isBalanced(root.right)
}
