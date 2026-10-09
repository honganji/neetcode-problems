// LeetCode provides this definition.
class TreeNode(var `val`: Int) {
    var left: TreeNode? = null
    var right: TreeNode? = null
}

fun kthSmallest(root: TreeNode?, k: Int): Int {
    val values = mutableListOf<Int>()

    fun inorder(node: TreeNode?) {
        if (node == null) {
            return
        }
        inorder(node.left)
        values.add(node.`val`)
        inorder(node.right)
    }

    inorder(root)
    return values[k - 1]
}
