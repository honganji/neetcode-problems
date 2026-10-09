// LeetCode provides this definition.
class ListNode(var `val`: Int) {
    var next: ListNode? = null
}

fun reverseKGroup(head: ListNode?, k: Int): ListNode? {
    val nodes = ArrayList<ListNode>()
    var node = head
    while (node != null) {
        nodes.add(node)
        node = node.next
    }

    val fullEnd = nodes.size - nodes.size % k
    for (start in 0 until fullEnd step k) {
        nodes.subList(start, start + k).reverse()
    }

    for (i in 0 until nodes.size - 1) {
        nodes[i].next = nodes[i + 1]
    }
    if (nodes.isEmpty()) {
        return null
    }
    nodes.last().next = null
    return nodes.first()
}
