# LeetCode provides this definition.
class ListNode:
    def __init__(self, val: int = 0, next: "ListNode | None" = None):
        self.val = val
        self.next = next


def remove_nth_from_end(head: ListNode | None, n: int) -> ListNode | None:
    nodes = []
    node = head
    while node is not None:
        nodes.append(node)
        node = node.next
    index = len(nodes) - n
    if index == 0:
        return head.next
    nodes[index - 1].next = nodes[index].next
    return head
