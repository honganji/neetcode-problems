// LeetCode provides this definition.
class ListNode(var `val`: Int) {
    var next: ListNode? = null
}

fun reverseList(head: ListNode?): ListNode? {
    if (head == null || head.next == null) {
        return head
    }
    val rest = head.next!!
    val newHead = reverseList(rest)
    rest.next = head
    head.next = null
    return newHead
}
