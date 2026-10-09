// LeetCode provides this definition.
class TreeNode(var `val`: Int) {
    var left: TreeNode? = null
    var right: TreeNode? = null
}

fun isValidBST(root: TreeNode?): Boolean {
    val values = ArrayList<Int>()

    fun inorder(node: TreeNode?) {
        if (node == null) return
        inorder(node.left)
        values.add(node.`val`)
        inorder(node.right)
    }

    inorder(root)
    for (i in 1 until values.size) {
        if (values[i] <= values[i - 1]) return false
    }
    return true
}
