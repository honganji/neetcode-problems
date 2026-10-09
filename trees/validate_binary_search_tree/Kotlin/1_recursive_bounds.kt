// LeetCode provides this definition.
class TreeNode(var `val`: Int) {
    var left: TreeNode? = null
    var right: TreeNode? = null
}

fun isValidBST(root: TreeNode?): Boolean {
    fun valid(node: TreeNode?, low: Int?, high: Int?): Boolean {
        if (node == null) return true
        if (low != null && node.`val` <= low) return false
        if (high != null && node.`val` >= high) return false
        return valid(node.left, low, node.`val`) && valid(node.right, node.`val`, high)
    }

    return valid(root, null, null)
}
