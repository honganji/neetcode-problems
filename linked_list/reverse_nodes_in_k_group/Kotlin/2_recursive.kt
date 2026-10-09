// LeetCode provides this definition.
class ListNode(var `val`: Int) {
    var next: ListNode? = null
}

fun reverseKGroup(head: ListNode?, k: Int): ListNode? {
    var node = head
    var count = 0
    while (node != null && count < k) {
        node = node.next
        count++
    }
    if (count < k) {
        return head
    }

    var prev: ListNode? = null
    var curr = head
    repeat(k) {
        val nxt = curr?.next
        curr?.next = prev
        prev = curr
        curr = nxt
    }

    head?.next = reverseKGroup(curr, k)
    return prev
}
