// LeetCode provides this definition.
class TreeNode(var `val`: Int) {
    var left: TreeNode? = null
    var right: TreeNode? = null
}

fun isSubtree(root: TreeNode?, subRoot: TreeNode?): Boolean {
    fun isSameTree(a: TreeNode?, b: TreeNode?): Boolean {
        if (a == null || b == null) {
            return a === b
        }
        return a.`val` == b.`val` &&
            isSameTree(a.left, b.left) &&
            isSameTree(a.right, b.right)
    }

    if (subRoot == null) {
        return true
    }
    if (root == null) {
        return false
    }
    if (isSameTree(root, subRoot)) {
        return true
    }
    return isSubtree(root.left, subRoot) || isSubtree(root.right, subRoot)
}
