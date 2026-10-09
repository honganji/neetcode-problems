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

    if (lists.isEmpty()) return null
    var current: List<ListNode?> = lists.toList()
    while (current.size > 1) {
        val merged = ArrayList<ListNode?>()
        var i = 0
        while (i < current.size) {
            val a = current[i]
            val b = if (i + 1 < current.size) current[i + 1] else null
            merged.add(mergeTwo(a, b))
            i += 2
        }
        current = merged
    }
    return current[0]
}
