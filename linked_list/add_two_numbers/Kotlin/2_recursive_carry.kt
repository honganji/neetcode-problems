// LeetCode provides this definition.
class ListNode(var `val`: Int) {
    var next: ListNode? = null
}

fun addTwoNumbers(l1: ListNode?, l2: ListNode?): ListNode? {
    fun add(a: ListNode?, b: ListNode?, carry: Int): ListNode? {
        if (a == null && b == null && carry == 0) {
            return null
        }
        val total = carry + (a?.`val` ?: 0) + (b?.`val` ?: 0)
        val node = ListNode(total % 10)
        node.next = add(a?.next, b?.next, total / 10)
        return node
    }

    return add(l1, l2, 0)
}
