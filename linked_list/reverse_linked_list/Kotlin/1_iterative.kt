// LeetCode provides this definition.
class ListNode(var `val`: Int) {
    var next: ListNode? = null
}

fun reverseList(head: ListNode?): ListNode? {
    var prev: ListNode? = null
    var curr = head
    while (curr != null) {
        val nextNode = curr.next
        curr.next = prev
        prev = curr
        curr = nextNode
    }
    return prev
}
