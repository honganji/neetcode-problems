// LeetCode provides this definition.
class ListNode(var `val`: Int) {
    var next: ListNode? = null
}

fun addTwoNumbers(l1: ListNode?, l2: ListNode?): ListNode? {
    val dummy = ListNode(0)
    var tail = dummy
    var a = l1
    var b = l2
    var carry = 0
    while (a != null || b != null || carry != 0) {
        var total = carry
        if (a != null) {
            total += a.`val`
            a = a.next
        }
        if (b != null) {
            total += b.`val`
            b = b.next
        }
        carry = total / 10
        val next = ListNode(total % 10)
        tail.next = next
        tail = next
    }
    return dummy.next
}
