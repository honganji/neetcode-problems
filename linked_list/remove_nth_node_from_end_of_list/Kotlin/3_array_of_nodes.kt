// LeetCode provides this definition.
class ListNode(var `val`: Int) {
    var next: ListNode? = null
}

fun removeNthFromEnd(head: ListNode?, n: Int): ListNode? {
    val nodes = ArrayList<ListNode>()
    var node = head
    while (node != null) {
        nodes.add(node)
        node = node.next
    }
    val index = nodes.size - n
    if (index == 0) {
        return head?.next
    }
    nodes[index - 1].next = nodes[index].next
    return head
}
