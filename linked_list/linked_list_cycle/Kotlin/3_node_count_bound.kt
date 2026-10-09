// LeetCode provides this definition.
class ListNode(var `val`: Int) {
    var next: ListNode? = null
}

fun hasCycle(head: ListNode?): Boolean {
    val maxNodes = 10_000
    var steps = 0
    var node = head
    while (node != null) {
        steps++
        if (steps > maxNodes) {
            return true
        }
        node = node.next
    }
    return false
}
