// LeetCode provides this definition.
class ListNode(var `val`: Int) {
    var next: ListNode? = null
}

fun reverseKGroup(head: ListNode?, k: Int): ListNode? {
    val dummy = ListNode(0)
    dummy.next = head
    var groupPrev: ListNode = dummy

    while (true) {
        var kth: ListNode? = groupPrev
        repeat(k) {
            kth = kth?.next
            if (kth == null) {
                return dummy.next
            }
        }
        val groupNext = kth?.next

        var prev = groupNext
        var curr = groupPrev.next
        while (curr !== groupNext) {
            val nxt = curr?.next
            curr?.next = prev
            prev = curr
            curr = nxt
        }

        val first = groupPrev.next!!
        groupPrev.next = kth
        groupPrev = first
    }
}
