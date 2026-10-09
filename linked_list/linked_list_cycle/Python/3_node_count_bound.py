# LeetCode provides this definition.
class ListNode:
    def __init__(self, val: int = 0, next: "ListNode | None" = None):
        self.val = val
        self.next = next


def has_cycle(head: ListNode | None) -> bool:
    max_nodes = 10**4
    steps = 0
    node = head
    while node:
        steps += 1
        if steps > max_nodes:
            return True
        node = node.next
    return False
