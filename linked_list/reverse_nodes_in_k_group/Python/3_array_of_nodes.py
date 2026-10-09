# LeetCode provides this definition.
class ListNode:
    def __init__(self, val: int = 0, next: "ListNode | None" = None):
        self.val = val
        self.next = next


def reverse_k_group(head: ListNode | None, k: int) -> ListNode | None:
    nodes = []
    node = head
    while node is not None:
        nodes.append(node)
        node = node.next

    for start in range(0, len(nodes) - len(nodes) % k, k):
        nodes[start:start + k] = nodes[start:start + k][::-1]

    for i in range(len(nodes) - 1):
        nodes[i].next = nodes[i + 1]
    if nodes:
        nodes[-1].next = None
        return nodes[0]
    return None
