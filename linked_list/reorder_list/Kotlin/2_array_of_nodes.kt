// LeetCode provides this definition.
class ListNode(var `val`: Int) {
    var next: ListNode? = null
}

fun reorderList(head: ListNode?): Unit {
    val nodes = ArrayList<ListNode>()
    var node = head
    while (node != null) {
        nodes.add(node)
        node = node.next
    }
    if (nodes.isEmpty()) return

    var left = 0
    var right = nodes.size - 1
    while (left < right) {
        nodes[left].next = nodes[right]
        left++
        if (left == right) break
        nodes[right].next = nodes[left]
        right--
    }
    nodes[left].next = null
}
