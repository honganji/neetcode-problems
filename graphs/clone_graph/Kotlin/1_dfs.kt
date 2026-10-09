class Node(var `val`: Int) {
    var neighbors: ArrayList<Node?> = ArrayList<Node?>()
}

fun cloneGraph(node: Node?): Node? {
    val copies = HashMap<Node, Node>()

    fun clone(original: Node?): Node? {
        if (original == null) return null

        val existing = copies[original]
        if (existing != null) return existing

        // Register the copy before visiting neighbors, so cycles stop here.
        val copy = Node(original.`val`)
        copies[original] = copy
        for (neighbor in original.neighbors) {
            copy.neighbors.add(clone(neighbor))
        }
        return copy
    }

    return clone(node)
}
