// LeetCode provides this definition.
class ListNode(var `val`: Int) {
    var next: ListNode? = null
}

fun addTwoNumbers(l1: ListNode?, l2: ListNode?): ListNode? {
    if (l1 == null) {
        return l2
    }
    val head = l1
    var a: ListNode? = l1
    var b = l2
    var prev = l1
    var carry = 0
    while (a != null && b != null) {
        val total = a.`val` + b.`val` + carry
        a.`val` = total % 10
        carry = total / 10
        prev = a
        a = a.next
        b = b.next
    }
    if (b != null) {
        prev.next = b
        a = b
    }
    while (a != null) {
        val total = a.`val` + carry
        a.`val` = total % 10
        carry = total / 10
        prev = a
        a = a.next
    }
    if (carry != 0) {
        prev.next = ListNode(carry)
    }
    return head
}
