# LeetCode provides this definition.
class ListNode:
    def __init__(self, val: int = 0, next: "ListNode | None" = None):
        self.val = val
        self.next = next


def reverse_k_group(head: ListNode | None, k: int) -> ListNode | None:
    node = head
    count = 0
    while node is not None and count < k:
        node = node.next
        count += 1
    if count < k:
        return head

    prev = None
    curr = head
    for _ in range(k):
        nxt = curr.next
        curr.next = prev
        prev = curr
        curr = nxt

    head.next = reverse_k_group(curr, k)
    return prev
