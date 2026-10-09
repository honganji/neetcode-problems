// LeetCode provides this definition.
class TreeNode(var `val`: Int) {
    var left: TreeNode? = null
    var right: TreeNode? = null
}

class Codec() {
    fun serialize(root: TreeNode?): String {
        if (root == null) return ""
        val tokens = mutableListOf<String>()
        val queue = ArrayDeque<TreeNode?>()
        queue.addLast(root)
        while (queue.isNotEmpty()) {
            val node = queue.removeFirst()
            if (node == null) {
                tokens.add("N")
                continue
            }
            tokens.add(node.`val`.toString())
            queue.addLast(node.left)
            queue.addLast(node.right)
        }
        return tokens.joinToString(",")
    }

    fun deserialize(data: String): TreeNode? {
        if (data.isEmpty()) return null
        val tokens = data.split(",")
        val root = TreeNode(tokens[0].toInt())
        val queue = ArrayDeque<TreeNode>()
        queue.addLast(root)
        var i = 1
        while (queue.isNotEmpty() && i < tokens.size) {
            val node = queue.removeFirst()
            if (tokens[i] != "N") {
                val left = TreeNode(tokens[i].toInt())
                node.left = left
                queue.addLast(left)
            }
            i++
            if (i < tokens.size && tokens[i] != "N") {
                val right = TreeNode(tokens[i].toInt())
                node.right = right
                queue.addLast(right)
            }
            i++
        }
        return root
    }
}
