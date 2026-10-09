class Node(var `val`: Int) {
    var neighbors: ArrayList<Node?> = ArrayList<Node?>()
}

fun cloneGraph(node: Node?): Node? {
    // No hash map: every lookup scans the list of (original, copy) pairs.
    val pairs = ArrayList<Pair<Node, Node>>()

    fun findCopy(original: Node): Node? =
        pairs.firstOrNull { it.first === original }?.second

    fun clone(original: Node?): Node? {
        if (original == null) return null

        val existing = findCopy(original)
        if (existing != null) return existing

        val copy = Node(original.`val`)
        pairs.add(Pair(original, copy))
        for (neighbor in original.neighbors) {
            copy.neighbors.add(clone(neighbor))
        }
        return copy
    }

    return clone(node)
}
