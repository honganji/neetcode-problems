// LeetCode provides this definition.
class TreeNode(var `val`: Int) {
    var left: TreeNode? = null
    var right: TreeNode? = null
}

fun lowestCommonAncestor(root: TreeNode?, p: TreeNode?, q: TreeNode?): TreeNode? {
    if (p == null || q == null) return null
    var node = root
    while (node != null) {
        node = when {
            p.`val` < node.`val` && q.`val` < node.`val` -> node.left
            p.`val` > node.`val` && q.`val` > node.`val` -> node.right
            else -> return node
        }
    }
    return null
}
