# LeetCode provides this definition.
class ListNode:
    def __init__(self, val: int = 0, next: "ListNode | None" = None):
        self.val = val
        self.next = next


def reorder_list(head: ListNode | None) -> None:
    current = head
    while current is not None and current.next is not None and current.next.next is not None:
        before_tail = current
        while before_tail.next.next is not None:
            before_tail = before_tail.next
        tail = before_tail.next
        before_tail.next = None
        tail.next = current.next
        current.next = tail
        current = tail.next
