// LeetCode provides this definition.
class TreeNode(var `val`: Int) {
    var left: TreeNode? = null
    var right: TreeNode? = null
}

fun bestDownward(node: TreeNode?): Int {
    if (node == null) return 0
    return node.`val` + maxOf(bestDownward(node.left), bestDownward(node.right), 0)
}

fun maxPathSum(root: TreeNode?): Int {
    if (root == null) return Int.MIN_VALUE
    val left = maxOf(bestDownward(root.left), 0)
    val right = maxOf(bestDownward(root.right), 0)
    val through = root.`val` + left + right
    return maxOf(through, maxPathSum(root.left), maxPathSum(root.right))
}
