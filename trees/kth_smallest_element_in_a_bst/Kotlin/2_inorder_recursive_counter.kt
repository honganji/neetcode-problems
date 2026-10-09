// LeetCode provides this definition.
class TreeNode(var `val`: Int) {
    var left: TreeNode? = null
    var right: TreeNode? = null
}

fun kthSmallest(root: TreeNode?, k: Int): Int {
    var count = 0
    var result = -1

    fun inorder(node: TreeNode?) {
        if (node == null || result != -1) {
            return
        }
        inorder(node.left)
        if (result != -1) {
            return
        }
        count++
        if (count == k) {
            result = node.`val`
            return
        }
        inorder(node.right)
    }

    inorder(root)
    return result
}
