// LeetCode provides this definition.
class ListNode(var `val`: Int) {
    var next: ListNode? = null
}

fun mergeTwoLists(list1: ListNode?, list2: ListNode?): ListNode? {
    val values = mutableListOf<Int>()
    for (head in listOf(list1, list2)) {
        var node = head
        while (node != null) {
            values.add(node.`val`)
            node = node.next
        }
    }
    values.sort()
    val dummy = ListNode(0)
    var tail = dummy
    for (v in values) {
        tail.next = ListNode(v)
        tail = tail.next!!
    }
    return dummy.next
}
