// LeetCode provides this definition.
class TreeNode(var `val`: Int) {
    var left: TreeNode? = null
    var right: TreeNode? = null
}

fun isSubtree(root: TreeNode?, subRoot: TreeNode?): Boolean {
    fun buildKeys(node: TreeNode?, keys: HashMap<TreeNode, String>): String {
        if (node == null) {
            return "N"
        }
        val leftKey = buildKeys(node.left, keys)
        val rightKey = buildKeys(node.right, keys)
        val key = "(#${node.`val`}$leftKey$rightKey)"
        keys[node] = key
        return key
    }

    val target = buildKeys(subRoot, HashMap())
    if (subRoot == null) {
        return true
    }
    val rootKeys = HashMap<TreeNode, String>()
    buildKeys(root, rootKeys)
    return rootKeys.values.any { it == target }
}
