# LeetCode provides this definition.
class ListNode:
    def __init__(self, val: int = 0, next: "ListNode | None" = None):
        self.val = val
        self.next = next


def merge_two_lists(
    list1: ListNode | None, list2: ListNode | None
) -> ListNode | None:
    values = []
    for head in (list1, list2):
        node = head
        while node:
            values.append(node.val)
            node = node.next
    values.sort()
    dummy = ListNode()
    tail = dummy
    for val in values:
        tail.next = ListNode(val)
        tail = tail.next
    return dummy.next
