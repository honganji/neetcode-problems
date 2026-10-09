# LeetCode provides this definition.
class Node:
    def __init__(self, x: int, next: "Node | None" = None, random: "Node | None" = None):
        self.val = x
        self.next = next
        self.random = random


def copy_random_list(head: "Node | None") -> "Node | None":
    memo = {}

    def copy(node: "Node | None") -> "Node | None":
        if node is None:
            return None
        if node in memo:
            return memo[node]
        clone = Node(node.val)
        memo[node] = clone
        clone.next = copy(node.next)
        clone.random = copy(node.random)
        return clone

    return copy(head)
