// LeetCode provides this definition.
class TreeNode(var `val`: Int) {
    var left: TreeNode? = null
    var right: TreeNode? = null
}

fun buildTree(preorder: IntArray, inorder: IntArray): TreeNode? {
    val indexOf = HashMap<Int, Int>()
    for (i in inorder.indices) {
        indexOf[inorder[i]] = i
    }
    var prePos = 0

    fun build(lo: Int, hi: Int): TreeNode? {
        if (lo > hi) return null
        val v = preorder[prePos++]
        val node = TreeNode(v)
        val mid = indexOf[v]!!
        node.left = build(lo, mid - 1)
        node.right = build(mid + 1, hi)
        return node
    }

    return build(0, inorder.size - 1)
}
