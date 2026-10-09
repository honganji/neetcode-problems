class Node(var `val`: Int) {
    var neighbors: ArrayList<Node?> = ArrayList<Node?>()
}

fun cloneGraph(node: Node?): Node? {
    if (node == null) return null

    val copies = HashMap<Node, Node>()
    copies[node] = Node(node.`val`)
    val queue = ArrayDeque<Node>()
    queue.add(node)

    while (queue.isNotEmpty()) {
        val current = queue.removeFirst()
        val currentCopy = copies.getValue(current)

        for (neighbor in current.neighbors) {
            if (neighbor == null) continue
            if (!copies.containsKey(neighbor)) {
                // First time we see this neighbor: make its copy and schedule it.
                copies[neighbor] = Node(neighbor.`val`)
                queue.add(neighbor)
            }
            currentCopy.neighbors.add(copies.getValue(neighbor))
        }
    }

    return copies[node]
}
