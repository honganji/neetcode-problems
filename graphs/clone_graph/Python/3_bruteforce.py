from typing import Optional


class Node:
    def __init__(self, val: int = 0, neighbors: Optional[list["Node"]] = None):
        self.val = val
        self.neighbors = neighbors if neighbors is not None else []


def clone_graph(node: Optional[Node]) -> Optional[Node]:
    # No dict: every lookup scans the list of (original, copy) pairs.
    pairs: list[tuple[Node, Node]] = []

    def find_copy(original: Node) -> Optional[Node]:
        for seen, copy in pairs:
            if seen is original:
                return copy
        return None

    def clone(original: Node) -> Node:
        existing = find_copy(original)
        if existing is not None:
            return existing

        copy = Node(original.val)
        pairs.append((original, copy))
        for neighbor in original.neighbors:
            copy.neighbors.append(clone(neighbor))
        return copy

    if node is None:
        return None
    return clone(node)
