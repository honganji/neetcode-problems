# LeetCode provides this definition.
class ListNode:
    def __init__(self, val: int = 0, next: "ListNode | None" = None):
        self.val = val
        self.next = next


def has_cycle(head: ListNode | None) -> bool:
    visited = set()
    node = head
    while node:
        if node in visited:
            return True
        visited.add(node)
        node = node.next
    return False
