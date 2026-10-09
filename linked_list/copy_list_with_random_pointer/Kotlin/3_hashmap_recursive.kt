// LeetCode provides this definition.
class Node(var `val`: Int) {
    var next: Node? = null
    var random: Node? = null
}

fun copyRandomList(head: Node?): Node? {
    val memo = HashMap<Node, Node>()

    fun copy(node: Node?): Node? {
        if (node == null) {
            return null
        }
        memo[node]?.let { return it }
        val clone = Node(node.`val`)
        memo[node] = clone
        clone.next = copy(node.next)
        clone.random = copy(node.random)
        return clone
    }

    return copy(head)
}
