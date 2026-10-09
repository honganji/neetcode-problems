// LeetCode provides this definition.
class ListNode(var `val`: Int) {
    var next: ListNode? = null
}

fun reorderList(head: ListNode?): Unit {
    if (head == null || head.next == null) return

    var slow: ListNode = head
    var fast: ListNode = head
    while (fast.next != null && fast.next!!.next != null) {
        slow = slow.next!!
        fast = fast.next!!.next!!
    }

    var second: ListNode? = slow.next
    slow.next = null
    var prev: ListNode? = null
    while (second != null) {
        val nxt = second.next
        second.next = prev
        prev = second
        second = nxt
    }

    var first: ListNode? = head
    second = prev
    while (second != null && first != null) {
        val firstNext = first.next
        val secondNext = second.next
        first.next = second
        second.next = firstNext
        first = firstNext
        second = secondNext
    }
}
