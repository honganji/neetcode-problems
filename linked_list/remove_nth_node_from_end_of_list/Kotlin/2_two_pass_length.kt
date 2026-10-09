// LeetCode provides this definition.
class ListNode(var `val`: Int) {
    var next: ListNode? = null
}

fun removeNthFromEnd(head: ListNode?, n: Int): ListNode? {
    var length = 0
    var node = head
    while (node != null) {
        length++
        node = node.next
    }
    val dummy = ListNode(0)
    dummy.next = head
    var prev: ListNode = dummy
    repeat(length - n) {
        prev = prev.next!!
    }
    prev.next = prev.next?.next
    return dummy.next
}
