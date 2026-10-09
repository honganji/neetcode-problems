// LeetCode provides this definition.
class TreeNode(var `val`: Int) {
    var left: TreeNode? = null
    var right: TreeNode? = null
}

fun isSameTree(p: TreeNode?, q: TreeNode?): Boolean {
    val queue = ArrayDeque<Pair<TreeNode?, TreeNode?>>()
    queue.addLast(Pair(p, q))
    while (queue.isNotEmpty()) {
        val (a, b) = queue.removeFirst()
        if (a == null && b == null) continue
        if (a == null || b == null || a.`val` != b.`val`) return false
        queue.addLast(Pair(a.left, b.left))
        queue.addLast(Pair(a.right, b.right))
    }
    return true
}
