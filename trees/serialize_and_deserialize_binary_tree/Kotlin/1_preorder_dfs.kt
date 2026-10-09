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
            tokens.add(node.`val`.toString())
            dfs(node.left)
            dfs(node.right)
        }

        dfs(root)
        return tokens.joinToString(",")
    }

    fun deserialize(data: String): TreeNode? {
        val tokens = data.split(",")
        var index = 0

        fun build(): TreeNode? {
            val token = tokens[index++]
            if (token == "N") return null
            val node = TreeNode(token.toInt())
            node.left = build()
            node.right = build()
            return node
        }

        return build()
    }
}
