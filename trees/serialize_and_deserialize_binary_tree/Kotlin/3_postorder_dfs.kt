// LeetCode provides this definition.
class TreeNode(var `val`: Int) {
    var left: TreeNode? = null
    var right: TreeNode? = null
}

class Codec() {
    fun serialize(root: TreeNode?): String {
        val tokens = mutableListOf<String>()

        fun dfs(node: TreeNode?) {
            if (node == null) {
                tokens.add("N")
                return
            }
            dfs(node.left)
            dfs(node.right)
            tokens.add(node.`val`.toString())
        }

        dfs(root)
        return tokens.joinToString(",")
    }

    fun deserialize(data: String): TreeNode? {
        val tokens = data.split(",")
        var index = tokens.size - 1

        fun build(): TreeNode? {
            val token = tokens[index--]
            if (token == "N") return null
            val node = TreeNode(token.toInt())
            node.right = build()
            node.left = build()
            return node
        }

        return build()
    }
}
