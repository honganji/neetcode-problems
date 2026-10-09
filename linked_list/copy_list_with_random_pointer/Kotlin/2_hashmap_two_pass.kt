// LeetCode provides this definition.
class Node(var `val`: Int) {
    var next: Node? = null
    var random: Node? = null
}

fun copyRandomList(head: Node?): Node? {
    val copies = HashMap<Node, Node>()
    var node = head
    while (node != null) {
        copies[node] = Node(node.`val`)
        node = node.next
    }
    node = head
    while (node != null) {
        val copy = copies[node]!!
        copy.next = node.next?.let { copies[it] }
        copy.random = node.random?.let { copies[it] }
        node = node.next
    }
    return head?.let { copies[it] }
}
