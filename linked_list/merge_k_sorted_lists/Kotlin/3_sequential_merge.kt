// LeetCode provides this definition.
class ListNode(var `val`: Int) {
    var next: ListNode? = null
}

fun mergeKLists(lists: Array<ListNode?>): ListNode? {
    fun mergeTwo(first: ListNode?, second: ListNode?): ListNode? {
        var a = first
        var b = second
        val dummy = ListNode(0)
        var tail = dummy
        while (a != null && b != null) {
            if (a.`val` <= b.`val`) {
                tail.next = a
                a = a.next
            } else {
                tail.next = b
                b = b.next
            }
            tail = tail.next!!
        }
        tail.next = a ?: b
        return dummy.next
    }

    var result: ListNode? = null
    for (head in lists) {
        result = mergeTwo(result, head)
    }
    return result
}
