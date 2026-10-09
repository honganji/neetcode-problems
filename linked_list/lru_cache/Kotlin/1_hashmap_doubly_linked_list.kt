class LRUCache(capacity: Int) {
    private class Node(val key: Int, var value: Int) {
        var prev: Node? = null
        var next: Node? = null
    }

    private val capacity = capacity
    private val nodes = HashMap<Int, Node>()
    private val head = Node(0, 0)
    private val tail = Node(0, 0)

    init {
        head.next = tail
        tail.prev = head
    }

    private fun remove(node: Node) {
        val prev = node.prev!!
        val next = node.next!!
        prev.next = next
        next.prev = prev
    }

    private fun addToFront(node: Node) {
        node.prev = head
        node.next = head.next
        head.next!!.prev = node
        head.next = node
    }

    fun get(key: Int): Int {
        val node = nodes[key] ?: return -1
        remove(node)
        addToFront(node)
        return node.value
    }

    fun put(key: Int, value: Int) {
        val existing = nodes[key]
        if (existing != null) {
            existing.value = value
            remove(existing)
            addToFront(existing)
            return
        }
        if (nodes.size == capacity) {
            val lru = tail.prev!!
            remove(lru)
            nodes.remove(lru.key)
        }
        val node = Node(key, value)
        nodes[key] = node
        addToFront(node)
    }
}
