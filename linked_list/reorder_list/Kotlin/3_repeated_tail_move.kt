// LeetCode provides this definition.
class ListNode(var `val`: Int) {
    var next: ListNode? = null
}

fun reorderList(head: ListNode?): Unit {
    var current = head
    while (current != null && current.next != null && current.next!!.next != null) {
        var beforeTail: ListNode = current
        while (beforeTail.next!!.next != null) {
            beforeTail = beforeTail.next!!
        }
        val tail = beforeTail.next!!
        beforeTail.next = null
        tail.next = current.next
        current.next = tail
        current = tail.next
    }
}
