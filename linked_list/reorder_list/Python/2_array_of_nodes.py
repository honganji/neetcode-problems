# LeetCode provides this definition.
class ListNode:
    def __init__(self, val: int = 0, next: "ListNode | None" = None):
        self.val = val
        self.next = next


def reorder_list(head: ListNode | None) -> None:
    nodes = []
    node = head
    while node is not None:
        nodes.append(node)
        node = node.next

    left, right = 0, len(nodes) - 1
    while left < right:
        nodes[left].next = nodes[right]
        left += 1
        if left == right:
            break
        nodes[right].next = nodes[left]
        right -= 1

    if nodes:
        nodes[left].next = None
