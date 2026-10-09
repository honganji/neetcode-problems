// LeetCode provides this definition.
class TreeNode(var `val`: Int) {
    var left: TreeNode? = null
    var right: TreeNode? = null
}

fun buildTree(preorder: IntArray, inorder: IntArray): TreeNode? {
    if (preorder.isEmpty()) return null
    val root = TreeNode(preorder[0])
    val stack = ArrayDeque<TreeNode>()
    stack.addLast(root)
    var inPos = 0
    for (i in 1 until preorder.size) {
        val node = TreeNode(preorder[i])
        if (stack.last().`val` != inorder[inPos]) {
            stack.last().left = node
        } else {
            var parent = stack.last()
            while (stack.isNotEmpty() && stack.last().`val` == inorder[inPos]) {
                parent = stack.removeLast()
                inPos++
            }
            parent.right = node
        }
        stack.addLast(node)
    }
    return root
}
