// LeetCode provides this definition.
class Node(var `val`: Int) {
    var next: Node? = null
    var random: Node? = null
}

fun copyRandomList(head: Node?): Node? {
    if (head == null) {
        return null
    }
    var node: Node? = head
    while (node != null) {
        val copy = Node(node.`val`)
        copy.next = node.next
        node.next = copy
        node = copy.next
    }
    node = head
    while (node != null) {
        val random = node.random
        if (random != null) {
            node.next!!.random = random.next
        }
        node = node.next!!.next
    }
    val newHead = head.next
    node = head
    while (node != null) {
        val copy = node.next!!
        node.next = copy.next
        copy.next = copy.next?.next
        node = node.next
    }
    return newHead
}
