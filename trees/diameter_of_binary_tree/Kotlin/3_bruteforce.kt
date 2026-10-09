// LeetCode provides this definition.
class TreeNode(var `val`: Int) {
    var left: TreeNode? = null
    var right: TreeNode? = null
}

fun height(node: TreeNode?): Int {
    if (node == null) return 0
    return 1 + maxOf(height(node.left), height(node.right))
}

fun diameterOfBinaryTree(root: TreeNode?): Int {
    if (root == null) return 0
    val throughRoot = height(root.left) + height(root.right)
    return maxOf(
        throughRoot,
        diameterOfBinaryTree(root.left),
        diameterOfBinaryTree(root.right)
    )
}
