// LeetCode provides this definition.
class ListNode(var `val`: Int) {
    var next: ListNode? = null
}

fun mergeTwoLists(list1: ListNode?, list2: ListNode?): ListNode? {
    val dummy = ListNode(0)
    var tail = dummy
    var a = list1
    var b = list2
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
