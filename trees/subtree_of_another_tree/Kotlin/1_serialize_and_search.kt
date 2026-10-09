// LeetCode provides this definition.
class TreeNode(var `val`: Int) {
    var left: TreeNode? = null
    var right: TreeNode? = null
}

fun isSubtree(root: TreeNode?, subRoot: TreeNode?): Boolean {
    fun serialize(node: TreeNode?): String {
        val builder = StringBuilder()
        fun walk(current: TreeNode?) {
            if (current == null) {
                builder.append(",N")
                return
            }
            builder.append(",#").append(current.`val`)
            walk(current.left)
            walk(current.right)
        }
        walk(node)
        return builder.toString()
    }

    fun kmpContains(text: String, pattern: String): Boolean {
        val failure = IntArray(pattern.length)
        var k = 0
        for (i in 1 until pattern.length) {
            while (k > 0 && pattern[i] != pattern[k]) {
                k = failure[k - 1]
            }
            if (pattern[i] == pattern[k]) {
                k++
            }
            failure[i] = k
        }
        k = 0
        for (ch in text) {
            while (k > 0 && ch != pattern[k]) {
                k = failure[k - 1]
            }
            if (ch == pattern[k]) {
                k++
            }
            if (k == pattern.length) {
                return true
            }
        }
        return false
    }

    return kmpContains(serialize(root), serialize(subRoot))
}
