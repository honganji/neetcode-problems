import java.util.PriorityQueue

// LeetCode provides this definition.
class ListNode(var `val`: Int) {
    var next: ListNode? = null
}

fun mergeKLists(lists: Array<ListNode?>): ListNode? {
    val heap = PriorityQueue<ListNode>(compareBy { it.`val` })
    for (head in lists) {
        if (head != null) heap.add(head)
    }

    val dummy = ListNode(0)
    var tail = dummy
    while (heap.isNotEmpty()) {
        val node = heap.poll()
        tail.next = node
        tail = node
        val next = node.next
        if (next != null) heap.add(next)
    }
    return dummy.next
}
