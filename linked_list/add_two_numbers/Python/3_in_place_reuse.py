# LeetCode provides this definition.
class ListNode:
    def __init__(self, val: int = 0, next: "ListNode | None" = None):
        self.val = val
        self.next = next


def add_two_numbers(l1: ListNode | None, l2: ListNode | None) -> ListNode | None:
    if l1 is None:
        return l2
    head = l1
    prev = l1
    carry = 0
    while l1 and l2:
        carry, l1.val = divmod(l1.val + l2.val + carry, 10)
        prev = l1
        l1, l2 = l1.next, l2.next
    if l2:
        prev.next = l2
        l1 = l2
    while l1:
        carry, l1.val = divmod(l1.val + carry, 10)
        prev = l1
        l1 = l1.next
    if carry:
        prev.next = ListNode(carry)
    return head
