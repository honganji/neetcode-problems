# LeetCode provides this definition.
class Node:
    def __init__(self, x: int, next: "Node | None" = None, random: "Node | None" = None):
        self.val = x
        self.next = next
        self.random = random


def copy_random_list(head: "Node | None") -> "Node | None":
    copies = {}
    node = head
    while node is not None:
        copies[node] = Node(node.val)
        node = node.next
    node = head
    while node is not None:
        copy = copies[node]
        copy.next = copies.get(node.next)
        copy.random = copies.get(node.random)
        node = node.next
    return copies.get(head)
