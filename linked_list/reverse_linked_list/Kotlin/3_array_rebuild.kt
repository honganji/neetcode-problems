// LeetCode provides this definition.
class ListNode(var `val`: Int) {
    var next: ListNode? = null
}

fun reverseList(head: ListNode?): ListNode? {
    val values = ArrayList<Int>()
    var node = head
    while (node != null) {
        values.add(node.`val`)
        node = node.next
    }
    val dummy = ListNode(0)
    var tail = dummy
    for (i in values.indices.reversed()) {
        val newNode = ListNode(values[i])
        tail.next = newNode
        tail = newNode
    }
    return dummy.next
}
