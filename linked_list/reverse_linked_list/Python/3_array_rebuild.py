# LeetCode provides this definition.
class ListNode:
    def __init__(self, val: int = 0, next: "ListNode | None" = None):
        self.val = val
        self.next = next


def reverse_list(head: ListNode | None) -> ListNode | None:
    values = []
    node = head
    while node:
        values.append(node.val)
        node = node.next
    dummy = ListNode()
    tail = dummy
    for val in reversed(values):
        tail.next = ListNode(val)
        tail = tail.next
    return dummy.next
