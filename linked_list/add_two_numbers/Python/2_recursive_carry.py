# LeetCode provides this definition.
class ListNode:
    def __init__(self, val: int = 0, next: "ListNode | None" = None):
        self.val = val
        self.next = next


def add_two_numbers(l1: ListNode | None, l2: ListNode | None) -> ListNode | None:
    def add(a: ListNode | None, b: ListNode | None, carry: int) -> ListNode | None:
        if a is None and b is None and carry == 0:
            return None
        total = carry
        if a:
            total += a.val
            a = a.next
        if b:
            total += b.val
            b = b.next
        carry, digit = divmod(total, 10)
        return ListNode(digit, add(a, b, carry))

    return add(l1, l2, 0)
