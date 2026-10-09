# LeetCode provides this definition.
class Node:
    def __init__(self, x: int, next: "Node | None" = None, random: "Node | None" = None):
        self.val = x
        self.next = next
        self.random = random


def copy_random_list(head: "Node | None") -> "Node | None":
    if head is None:
        return None
    node = head
    while node is not None:
        copy = Node(node.val, node.next)
        node.next = copy
        node = copy.next
    node = head
    while node is not None:
        if node.random is not None:
            node.next.random = node.random.next
        node = node.next.next
    new_head = head.next
    node = head
    while node is not None:
        copy = node.next
        node.next = copy.next
        if copy.next is not None:
            copy.next = copy.next.next
        node = node.next
    return new_head
