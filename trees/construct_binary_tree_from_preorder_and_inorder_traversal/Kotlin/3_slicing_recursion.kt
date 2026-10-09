// LeetCode provides this definition.
class TreeNode(var `val`: Int) {
    var left: TreeNode? = null
    var right: TreeNode? = null
}

fun buildTree(preorder: IntArray, inorder: IntArray): TreeNode? {
    if (preorder.isEmpty()) return null
    val rootVal = preorder[0]
    val mid = inorder.indexOf(rootVal)
    val root = TreeNode(rootVal)
    root.left = buildTree(
        preorder.copyOfRange(1, mid + 1),
        inorder.copyOfRange(0, mid)
    )
    root.right = buildTree(
        preorder.copyOfRange(mid + 1, preorder.size),
        inorder.copyOfRange(mid + 1, inorder.size)
    )
    return root
}
