// LeetCode provides this definition.
class ListNode(var `val`: Int) {
    var next: ListNode? = null
}

fun removeNthFromEnd(head: ListNode?, n: Int): ListNode? {
    val dummy = ListNode(0)
    dummy.next = head
    var fast: ListNode? = dummy
    var slow: ListNode = dummy
    repeat(n + 1) {
        fast = fast?.next
    }
    while (fast != null) {
        fast = fast?.next
        slow = slow.next!!
    }
    slow.next = slow.next?.next
    return dummy.next
}
